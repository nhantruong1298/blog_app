// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String errorMessage) exception,
    required TResult Function(SignInResult result) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(SignInSuccessState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;
}

/// @nodoc
abstract class _$$SignInInitialCopyWith<$Res> {
  factory _$$SignInInitialCopyWith(
          _$SignInInitial value, $Res Function(_$SignInInitial) then) =
      __$$SignInInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInInitialCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements _$$SignInInitialCopyWith<$Res> {
  __$$SignInInitialCopyWithImpl(
      _$SignInInitial _value, $Res Function(_$SignInInitial) _then)
      : super(_value, (v) => _then(v as _$SignInInitial));

  @override
  _$SignInInitial get _value => super._value as _$SignInInitial;
}

/// @nodoc

class _$SignInInitial implements SignInInitial {
  const _$SignInInitial();

  @override
  String toString() {
    return 'SignInState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String errorMessage) exception,
    required TResult Function(SignInResult result) success,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
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
    required TResult Function(SignInInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(SignInSuccessState value) success,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class SignInInitial implements SignInState {
  const factory SignInInitial() = _$SignInInitial;
}

/// @nodoc
abstract class _$$LoadingStateCopyWith<$Res> {
  factory _$$LoadingStateCopyWith(
          _$LoadingState value, $Res Function(_$LoadingState) then) =
      __$$LoadingStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class __$$LoadingStateCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
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
    return 'SignInState.loading(isLoading: $isLoading)';
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
    required TResult Function(String errorMessage) exception,
    required TResult Function(SignInResult result) success,
  }) {
    return loading(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
  }) {
    return loading?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
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
    required TResult Function(SignInInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(SignInSuccessState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements SignInState {
  const factory LoadingState(final bool isLoading) = _$LoadingState;

  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$LoadingStateCopyWith<_$LoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInExceptionStateCopyWith<$Res> {
  factory _$$SignInExceptionStateCopyWith(_$SignInExceptionState value,
          $Res Function(_$SignInExceptionState) then) =
      __$$SignInExceptionStateCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class __$$SignInExceptionStateCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements _$$SignInExceptionStateCopyWith<$Res> {
  __$$SignInExceptionStateCopyWithImpl(_$SignInExceptionState _value,
      $Res Function(_$SignInExceptionState) _then)
      : super(_value, (v) => _then(v as _$SignInExceptionState));

  @override
  _$SignInExceptionState get _value => super._value as _$SignInExceptionState;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$SignInExceptionState(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInExceptionState implements SignInExceptionState {
  const _$SignInExceptionState(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'SignInState.exception(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInExceptionState &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$SignInExceptionStateCopyWith<_$SignInExceptionState> get copyWith =>
      __$$SignInExceptionStateCopyWithImpl<_$SignInExceptionState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String errorMessage) exception,
    required TResult Function(SignInResult result) success,
  }) {
    return exception(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
  }) {
    return exception?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(SignInSuccessState value) success,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class SignInExceptionState implements SignInState {
  const factory SignInExceptionState(final String errorMessage) =
      _$SignInExceptionState;

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SignInExceptionStateCopyWith<_$SignInExceptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInSuccessStateCopyWith<$Res> {
  factory _$$SignInSuccessStateCopyWith(_$SignInSuccessState value,
          $Res Function(_$SignInSuccessState) then) =
      __$$SignInSuccessStateCopyWithImpl<$Res>;
  $Res call({SignInResult result});
}

/// @nodoc
class __$$SignInSuccessStateCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements _$$SignInSuccessStateCopyWith<$Res> {
  __$$SignInSuccessStateCopyWithImpl(
      _$SignInSuccessState _value, $Res Function(_$SignInSuccessState) _then)
      : super(_value, (v) => _then(v as _$SignInSuccessState));

  @override
  _$SignInSuccessState get _value => super._value as _$SignInSuccessState;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$SignInSuccessState(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as SignInResult,
    ));
  }
}

/// @nodoc

class _$SignInSuccessState implements SignInSuccessState {
  const _$SignInSuccessState(this.result);

  @override
  final SignInResult result;

  @override
  String toString() {
    return 'SignInState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInSuccessState &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$SignInSuccessStateCopyWith<_$SignInSuccessState> get copyWith =>
      __$$SignInSuccessStateCopyWithImpl<_$SignInSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(String errorMessage) exception,
    required TResult Function(SignInResult result) success,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(String errorMessage)? exception,
    TResult Function(SignInResult result)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignInExceptionState value) exception,
    required TResult Function(SignInSuccessState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignInExceptionState value)? exception,
    TResult Function(SignInSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SignInSuccessState implements SignInState {
  const factory SignInSuccessState(final SignInResult result) =
      _$SignInSuccessState;

  SignInResult get result => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SignInSuccessStateCopyWith<_$SignInSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}
