import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_presentation/exception/app_exception.dart';
import 'package:pet_presentation/feature/data_list/cubit/data_list_cubit.dart';
import 'package:pet_presentation/feature/data_list/data_list_builder.dart';
import 'package:pet_presentation/feature/data_list/views/error.view.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_constants.dart';
import 'package:pet_presentation/widgets/commons/loading_indicator/circular_loading.dart';
import 'package:pet_presentation/widgets/spacing.dart';

class DataListView extends StatefulWidget {
  final WidgetListBuilder? loadingBuilder;
  final WidgetListBuilder contentBuilder;
  final Function(dynamic error)? onLoadDataError;
  final Widget Function(AppException exception)? errorBuilder;
  const DataListView({
    Key? key,
    required this.contentBuilder,
    this.loadingBuilder,
    this.onLoadDataError,
    this.errorBuilder,
  }) : super(key: key);

  @override
  State<DataListView> createState() => DataListViewState();
}

class DataListViewState extends State<DataListView> {
  // bool willShowRefreshIndicator = false;
  bool isDisposed = false;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: AppColors.primaryColor500,
        onRefresh: () async {
          onPullToRefresh();
          do {
            await Future.delayed(const Duration(milliseconds: 500));
          } while (BlocProvider.of<DataListCubit>(context).state
                  is DataListRefreshingState &&
              !isDisposed);
          return Future.value();
        },
        child: _buildMainContent());
  }

  Widget _buildMainContent() {
    return BlocBuilder<DataListCubit, DataListState>(
      builder: (context, state) {
        return state.when(
          () => const SizedBox.shrink(),
          loading: (_, __) => _DataLoadingView(
            state: state,
            loadingBuilder: widget.loadingBuilder,
          ),
          loadingMore: (_, __) => _DataLoadingView(
            loadingBuilder: widget.loadingBuilder,
            state: state,
          ),
          refreshing: (prevData) => prevData == null
              ? _DataLoadingView(
                  state: state,
                  loadingBuilder: widget.loadingBuilder,
                )
              : _DataReadyView(
                  state: state, contentBuilder: widget.contentBuilder),
          loaded: (_, __) => _DataReadyView(
            state: state,
            contentBuilder: widget.contentBuilder,
            onScrollToBottom: () {},
          ),
          loadedMore: (currentPage, data, moreData) => _DataReadyView(
              state: state, contentBuilder: widget.contentBuilder),
          failed: (exception) => _DataErrorView(
            onRetry: _onRetryLoadData,
            customView: widget.errorBuilder,
          ),
        );
      },
    );
  }

  void onPullToRefresh() {
    final cubit = BlocProvider.of<DataListCubit>(context);
    cubit.onPullToRefresh();
  }

  void _onRetryLoadData() {
    final cubit = BlocProvider.of<DataListCubit>(context);
    cubit.onRetryLoadData();
  }
}

///
///* Widget only show spinner if
///* refreshing data is not null or first load
class _DataLoadingView extends StatelessWidget {
  final DataListState state;
  const _DataLoadingView({
    Key? key,
    this.loadingBuilder,
    required this.state,
  }) : super(key: key);
  double get iconSize => 300;

  final WidgetListBuilder? loadingBuilder;

  Widget _buildLoadingSpinner(dynamic prevData) {
    return loadingBuilder?.call() ??
        Container(
          alignment: Alignment.center,
          color: AppColors.backgroundColor,
          child: const CircularLoading(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, _) {
        return AnimatedSwitcher(
            duration: AppConstants.defaultDuration,
            child: state.maybeWhen(() => _buildLoadingSpinner(null),
                refreshing: (dynamic prevData) =>
                    _buildLoadingSpinner(prevData),
                loading: (int currentPage, dynamic prevData) =>
                    _buildLoadingSpinner(prevData),
                loadingMore: (int currentPage, dynamic prevData) =>
                    _buildLoadingSpinner(prevData),
                orElse: () => const SizedBox.shrink()));
      },
    );
  }
}

class _DataErrorView extends StatelessWidget {
  final VoidCallback? onRetry;
  final Widget Function(AppException exception)? customView;
  const _DataErrorView({
    Key? key,
    this.onRetry,
    this.customView,
  }) : super(key: key);

  Widget _getErrorWidget(AppException err) =>
      customView?.call(err) ??
      ErrorView(
        exception: err,
        onRetry: onRetry,
      );

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DataListCubit, DataListState, AppException?>(
      selector: (state) {
        return state.maybeWhen(null,
            failed: (loadingError) => loadingError, orElse: () => null);
      },
      builder: (context, loadingError) {
        return loadingError != null
            ? _getErrorWidget(loadingError)
            : const SizedBox.shrink();
      },
    );
  }
}

class _DataReadyView extends StatelessWidget {
  final VoidCallback? onScrollToBottom;
  final DataListState state;
  final WidgetListBuilder contentBuilder;

  double get iconSize => 24;

  const _DataReadyView({
    Key? key,
    this.onScrollToBottom,
    required this.contentBuilder,
    required this.state,
  }) : super(key: key);

  Widget _buildDataView(context) {
    var content = NotificationListener(
      child: LayoutBuilder(
        builder: (context, __) {
          return state.maybeWhen(() => const SizedBox.shrink(),
              refreshing: (prevData) => contentBuilder(),
              loaded: (currentPage, data) => contentBuilder(),
              loadedMore: (currentPage, data, moreData) => contentBuilder(),
              orElse: () => const SizedBox.shrink());
        },
      ),
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.axisDirection != AxisDirection.down) {
          return false;
        }
        if (scrollInfo is! ScrollEndNotification) {
          return false;
        }
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.minScrollExtent &&
            !scrollInfo.metrics.outOfRange) {
          return false;
        }
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          final cubit = BlocProvider.of<DataListCubit>(context);
          cubit.onScrollToBottom();
          return true;
        }
        return false;
      },
    );

    return Stack(
      children: <Widget>[
        content,
        BlocSelector<DataListCubit, DataListState, bool>(
          selector: (state) {
            return state.maybeWhen(() => false,
                loadingMore: (currentPage, predData) => true,
                orElse: () => false);
          },
          builder: (context, isLoadingMore) {
            return isLoadingMore
                ? Positioned(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: iconSize,
                            height: iconSize,
                            child: const CircularProgressIndicator(
                              backgroundColor: AppColors.backgroundColor,
                              strokeWidth: 3,
                            ),
                          ),
                          const Spacing(1),
                        ],
                      ),
                    ),
                  )
                : Container();
          },
        )
        //
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataListCubit, DataListState>(
      buildWhen: (previous, current) =>
          current is DataListLoadedState ||
          current is DataListLoadedMoreState ||
          current is DataListRefreshingState,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: AppConstants.defaultDuration,
          child: _buildDataView(context),
        );
      },
    );
    // return BlocSelector<DataListCubit, DataListState, bool>(
    //   selector: (state) => state.maybeWhen(() => false,
    //       refreshing: (prevData) => prevData != null, orElse: () => true),
    //   builder: (context, isDataReady) {
    //     return AnimatedSwitcher(
    //       duration: AppConstants.defaultDuration,
    //       child: isDataReady ? _buildDataView(context) : Container(),
    //     );
    //   },
    // );
  }
}
