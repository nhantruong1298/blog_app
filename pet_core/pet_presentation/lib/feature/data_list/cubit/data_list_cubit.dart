import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_domain/model/load_data.dart';
import 'package:pet_presentation/exception/app.exception_handler.dart';
import 'package:pet_presentation/exception/app_exception.dart';
import 'package:pet_presentation/feature/data_list/data_list_builder.dart';
import 'package:pet_presentation/injectors/all.dart';

part 'data_list_cubit.freezed.dart';
part 'data_list_state.dart';

class DataListCubit extends Cubit<DataListState> {
  int currentPage = 0;
  LoadDataMode loadDataMode;

  dynamic dataList;
  dynamic moreDataList;
  CancelableOperation? loadingDataOperation;

  late AppExceptionHandler _appExceptionHandler;
  final DataLoaderCalback onloadData;
  final int pageSize;
  final bool isPaging;

  final void Function(dynamic data, {int? currentPage, int? pageSize})
      onLoadDataCompleted;
  final Function(dynamic error)? onLoadDataError;

  DataListCubit({
    required this.onloadData,
    required this.pageSize,
    required this.isPaging,
    required this.onLoadDataCompleted,
    required this.onLoadDataError,
    this.loadDataMode = LoadDataMode.PREFER_ONLINE_DATA,
  }) : super(const DataListState()) {
    _appExceptionHandler = getIt<AppExceptionHandler>();

    _initState();
  }

  void onPullToRefresh() {
    _executeLoadData(refreshing: true);
  }

  void _initState() {
    onPullToRefresh();
  }

  Future<dynamic> loadDataFromRepository(
      {int currentPage = 0, int pageSize = 20}) async {
    // TODO: add cache handing here
    // final isLoadFromCache = loadDataMode == LoadDataMode.PREFER_OFFLINE_DATA;

    final results =
        await onloadData(currentPage: currentPage, pageSize: pageSize);

    return results;
  }

  void _executeLoadData({bool refreshing = false, bool loadMore = false}) {
    DataListState loadingState = DataListLoadingState(
      currentPage: currentPage,
      prevData: dataList,
    );

    if (refreshing) {
      currentPage = 0;
      loadingState = (DataListRefreshingState(prevData: dataList));
    }
    if (loadMore) {
      loadingState = (DataListLoadingMoreState(currentPage: currentPage));
    }

    emit(loadingState);

    loadingDataOperation = CancelableOperation.fromFuture(
      loadDataFromRepository(
        currentPage: currentPage,
        pageSize: pageSize,
      ).then((value) {
        if (currentPage == 0) {
          dataList = value;
          emit(DataListLoadedState(
            currentPage: currentPage,
            data: dataList,
          ));
        } else {
          moreDataList = value;

          emit(DataListLoadedMoreState(
              moreData: moreDataList, prevData: dataList));
        }

        onLoadDataCompleted(value,
            currentPage: currentPage, pageSize: pageSize);
      }).catchError((error, stackTrace) {
        AppException appException =
            _appExceptionHandler.map(error, stackTrace: stackTrace);
        emit(DataListLoadFailedState(loadingError: appException));
        if (onLoadDataError != null) onLoadDataError!(appException);
      }),
      onCancel: () => {},
    );
  }

  onForceRefreshingData() {
    loadingDataOperation?.cancel();

    _executeLoadData(refreshing: true);
  }

  void onRetryLoadData() {
    loadingDataOperation?.cancel();
    _executeLoadData(refreshing: true);
  }

  void onScrollToBottom() {
    bool needToLoadMore = _needToLoadMore();
    if (!needToLoadMore) {
      return;
    }
    currentPage = currentPage + 1;

    _executeLoadData(loadMore: true);
  }

  bool _needToLoadMore() => isPaging;
}
