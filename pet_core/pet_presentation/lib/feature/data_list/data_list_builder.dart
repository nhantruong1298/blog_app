import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_domain/model/load_data.dart';
import 'package:pet_presentation/exception/app_exception.dart';

import './cubit/data_list_cubit.dart';
import 'views/data_list_view.dart';

typedef WidgetListBuilder = Widget Function();

typedef DataLoaderCalback = Future<dynamic> Function(
    {int? currentPage, int? pageSize});

class DataListBuilder extends StatefulWidget {
  final LoadDataMode loadDataMode;
  final WidgetListBuilder? loadingBuilder;
  final WidgetListBuilder contentBuilder;
  final DataLoaderCalback dataProvider;
  final void Function(dynamic error)? onLoadDataError;
  final Widget Function(AppException exception)? errorBuilder;
  final void Function(dynamic data, {int? currentPage, int? pageSize})
      onLoadDataCompleted;

  final bool isPaging;
  final int pageSize;
  final DataListCubit? cubit;
  const DataListBuilder({
    Key? key,
    required this.dataProvider,
    required this.contentBuilder,
    required this.onLoadDataCompleted,
    this.loadDataMode = LoadDataMode.PREFER_REFRESHING_DATA_IN_BACKGROUND,
    this.errorBuilder,
    this.loadingBuilder,
    this.onLoadDataError,
    this.isPaging = false,
    this.pageSize = 20,
    this.cubit,
  }) : super(key: key);

  @override
  State<DataListBuilder> createState() => DataListBuilderState();
}

class DataListBuilderState<T> extends State<DataListBuilder> {
  GlobalKey<DataListViewState> key = GlobalKey();

  void pullToRfersh() {
    key.currentState?.onPullToRefresh();
  }

  late final DataListCubit dataCubit = widget.cubit ??
      DataListCubit(
        onloadData: widget.dataProvider,
        loadDataMode: widget.loadDataMode,
        isPaging: widget.isPaging,
        pageSize: widget.pageSize,
        onLoadDataCompleted: widget.onLoadDataCompleted,
        onLoadDataError: widget.onLoadDataError,
      );
  @override
  void dispose() {
    dataCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataListCubit>(
        create: (_) => dataCubit,
        child: DataListView(
          key: key,
          onLoadDataError: widget.onLoadDataError,
          loadingBuilder: widget.loadingBuilder,
          contentBuilder: widget.contentBuilder,
          errorBuilder: widget.errorBuilder,
        ));
  }
}
