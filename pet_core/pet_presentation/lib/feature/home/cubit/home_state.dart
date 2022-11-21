part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.init() = HomeInitial;
  const factory HomeState.loading(bool isLoading) = LoadingState;
  const factory HomeState.exception(AppException appException) =
      HomeExceptionState;
  const factory HomeState.loaded(
    String userName,
    List<LoadBlogResult> blogs,
  ) = HomeLoadedState;
}
