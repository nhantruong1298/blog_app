// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(AppException appException) exception,
    required TResult Function(String userName) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(HomeExceptionState value) exception,
    required TResult Function(HomeLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;
}

/// @nodoc
abstract class _$$HomeInitialCopyWith<$Res> {
  factory _$$HomeInitialCopyWith(
          _$HomeInitial value, $Res Function(_$HomeInitial) then) =
      __$$HomeInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeInitialCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeInitialCopyWith<$Res> {
  __$$HomeInitialCopyWithImpl(
      _$HomeInitial _value, $Res Function(_$HomeInitial) _then)
      : super(_value, (v) => _then(v as _$HomeInitial));

  @override
  _$HomeInitial get _value => super._value as _$HomeInitial;
}

/// @nodoc

class _$HomeInitial implements HomeInitial {
  const _$HomeInitial();

  @override
  String toString() {
    return 'HomeState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(AppException appException) exception,
    required TResult Function(String userName) loaded,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(HomeExceptionState value) exception,
    required TResult Function(HomeLoadedState value) loaded,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class HomeInitial implements HomeState {
  const factory HomeInitial() = _$HomeInitial;
}

/// @nodoc
abstract class _$$LoadingStateCopyWith<$Res> {
  factory _$$LoadingStateCopyWith(
          _$LoadingState value, $Res Function(_$LoadingState) then) =
      __$$LoadingStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class __$$LoadingStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$LoadingStateCopyWith<$Res> {
  __$$LoadingStateCopyWithImpl(
      _$LoadingState _value, $Res Function(_$LoadingState) _then)
      : super(_value, (v) => _then(v as _$LoadingState));

  @override
  _$LoadingState get _value => super._value as _$LoadingState;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_$LoadingState(
      isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingState implements LoadingState {
  const _$LoadingState(this.isLoading);

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'HomeState.loading(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$LoadingStateCopyWith<_$LoadingState> get copyWith =>
      __$$LoadingStateCopyWithImpl<_$LoadingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(AppException appException) exception,
    required TResult Function(String userName) loaded,
  }) {
    return loading(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
  }) {
    return loading?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(HomeExceptionState value) exception,
    required TResult Function(HomeLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements HomeState {
  const factory LoadingState(final bool isLoading) = _$LoadingState;

  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$LoadingStateCopyWith<_$LoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeExceptionStateCopyWith<$Res> {
  factory _$$HomeExceptionStateCopyWith(_$HomeExceptionState value,
          $Res Function(_$HomeExceptionState) then) =
      __$$HomeExceptionStateCopyWithImpl<$Res>;
  $Res call({AppException appException});
}

/// @nodoc
class __$$HomeExceptionStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeExceptionStateCopyWith<$Res> {
  __$$HomeExceptionStateCopyWithImpl(
      _$HomeExceptionState _value, $Res Function(_$HomeExceptionState) _then)
      : super(_value, (v) => _then(v as _$HomeExceptionState));

  @override
  _$HomeExceptionState get _value => super._value as _$HomeExceptionState;

  @override
  $Res call({
    Object? appException = freezed,
  }) {
    return _then(_$HomeExceptionState(
      appException == freezed
          ? _value.appException
          : appException // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$HomeExceptionState implements HomeExceptionState {
  const _$HomeExceptionState(this.appException);

  @override
  final AppException appException;

  @override
  String toString() {
    return 'HomeState.exception(appException: $appException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeExceptionState &&
            const DeepCollectionEquality()
                .equals(other.appException, appException));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(appException));

  @JsonKey(ignore: true)
  @override
  _$$HomeExceptionStateCopyWith<_$HomeExceptionState> get copyWith =>
      __$$HomeExceptionStateCopyWithImpl<_$HomeExceptionState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(AppException appException) exception,
    required TResult Function(String userName) loaded,
  }) {
    return exception(appException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
  }) {
    return exception?.call(appException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(appException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(HomeExceptionState value) exception,
    required TResult Function(HomeLoadedState value) loaded,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class HomeExceptionState implements HomeState {
  const factory HomeExceptionState(final AppException appException) =
      _$HomeExceptionState;

  AppException get appException => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$HomeExceptionStateCopyWith<_$HomeExceptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeLoadedStateCopyWith<$Res> {
  factory _$$HomeLoadedStateCopyWith(
          _$HomeLoadedState value, $Res Function(_$HomeLoadedState) then) =
      __$$HomeLoadedStateCopyWithImpl<$Res>;
  $Res call({String userName});
}

/// @nodoc
class __$$HomeLoadedStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res>
    implements _$$HomeLoadedStateCopyWith<$Res> {
  __$$HomeLoadedStateCopyWithImpl(
      _$HomeLoadedState _value, $Res Function(_$HomeLoadedState) _then)
      : super(_value, (v) => _then(v as _$HomeLoadedState));

  @override
  _$HomeLoadedState get _value => super._value as _$HomeLoadedState;

  @override
  $Res call({
    Object? userName = freezed,
  }) {
    return _then(_$HomeLoadedState(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeLoadedState implements HomeLoadedState {
  const _$HomeLoadedState(this.userName);

  @override
  final String userName;

  @override
  String toString() {
    return 'HomeState.loaded(userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeLoadedState &&
            const DeepCollectionEquality().equals(other.userName, userName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userName));

  @JsonKey(ignore: true)
  @override
  _$$HomeLoadedStateCopyWith<_$HomeLoadedState> get copyWith =>
      __$$HomeLoadedStateCopyWithImpl<_$HomeLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(AppException appException) exception,
    required TResult Function(String userName) loaded,
  }) {
    return loaded(userName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
  }) {
    return loaded?.call(userName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(AppException appException)? exception,
    TResult Function(String userName)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(userName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(HomeExceptionState value) exception,
    required TResult Function(HomeLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(HomeExceptionState value)? exception,
    TResult Function(HomeLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeLoadedState implements HomeState {
  const factory HomeLoadedState(final String userName) = _$HomeLoadedState;

  String get userName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$HomeLoadedStateCopyWith<_$HomeLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
