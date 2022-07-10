part of 'data_list_cubit.dart';

@freezed
class DataListState with _$DataListState {
  const factory DataListState() = _DataListState;

  const factory DataListState.refreshing({
    dynamic prevData,
  }) = DataListRefreshingState;

  const factory DataListState.loading({
    @Default(1) int currentPage,
    dynamic prevData,
  }) = DataListLoadingState;

  const factory DataListState.loadingMore({
    @Default(1) int currentPage,
    dynamic prevData,
  }) = DataListLoadingMoreState;

  const factory DataListState.loaded({
    @Default(1) int currentPage,
    dynamic data,
  }) = DataListLoadedState;

  const factory DataListState.loadedMore({
    @Default(1) int currentPage,
    dynamic prevData,
    dynamic moreData,
  }) = DataListLoadedMoreState;

  const factory DataListState.failed({AppException? loadingError}) =
      DataListLoadFailedState;
}
