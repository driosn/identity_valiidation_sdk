// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validador_identidad_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ValidadorIdentidadState {
  DatosValidacion get datosValidacion => throw _privateConstructorUsedError;
  EstadoValidacion get estadoValidacion => throw _privateConstructorUsedError;

  /// Create a copy of ValidadorIdentidadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidadorIdentidadStateCopyWith<ValidadorIdentidadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidadorIdentidadStateCopyWith<$Res> {
  factory $ValidadorIdentidadStateCopyWith(
    ValidadorIdentidadState value,
    $Res Function(ValidadorIdentidadState) then,
  ) = _$ValidadorIdentidadStateCopyWithImpl<$Res, ValidadorIdentidadState>;
  @useResult
  $Res call({
    DatosValidacion datosValidacion,
    EstadoValidacion estadoValidacion,
  });

  $DatosValidacionCopyWith<$Res> get datosValidacion;
  $EstadoValidacionCopyWith<$Res> get estadoValidacion;
}

/// @nodoc
class _$ValidadorIdentidadStateCopyWithImpl<
  $Res,
  $Val extends ValidadorIdentidadState
>
    implements $ValidadorIdentidadStateCopyWith<$Res> {
  _$ValidadorIdentidadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidadorIdentidadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? datosValidacion = null, Object? estadoValidacion = null}) {
    return _then(
      _value.copyWith(
            datosValidacion:
                null == datosValidacion
                    ? _value.datosValidacion
                    : datosValidacion // ignore: cast_nullable_to_non_nullable
                        as DatosValidacion,
            estadoValidacion:
                null == estadoValidacion
                    ? _value.estadoValidacion
                    : estadoValidacion // ignore: cast_nullable_to_non_nullable
                        as EstadoValidacion,
          )
          as $Val,
    );
  }

  /// Create a copy of ValidadorIdentidadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DatosValidacionCopyWith<$Res> get datosValidacion {
    return $DatosValidacionCopyWith<$Res>(_value.datosValidacion, (value) {
      return _then(_value.copyWith(datosValidacion: value) as $Val);
    });
  }

  /// Create a copy of ValidadorIdentidadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstadoValidacionCopyWith<$Res> get estadoValidacion {
    return $EstadoValidacionCopyWith<$Res>(_value.estadoValidacion, (value) {
      return _then(_value.copyWith(estadoValidacion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ValidadorIdentidadStateImplCopyWith<$Res>
    implements $ValidadorIdentidadStateCopyWith<$Res> {
  factory _$$ValidadorIdentidadStateImplCopyWith(
    _$ValidadorIdentidadStateImpl value,
    $Res Function(_$ValidadorIdentidadStateImpl) then,
  ) = __$$ValidadorIdentidadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DatosValidacion datosValidacion,
    EstadoValidacion estadoValidacion,
  });

  @override
  $DatosValidacionCopyWith<$Res> get datosValidacion;
  @override
  $EstadoValidacionCopyWith<$Res> get estadoValidacion;
}

/// @nodoc
class __$$ValidadorIdentidadStateImplCopyWithImpl<$Res>
    extends
        _$ValidadorIdentidadStateCopyWithImpl<
          $Res,
          _$ValidadorIdentidadStateImpl
        >
    implements _$$ValidadorIdentidadStateImplCopyWith<$Res> {
  __$$ValidadorIdentidadStateImplCopyWithImpl(
    _$ValidadorIdentidadStateImpl _value,
    $Res Function(_$ValidadorIdentidadStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ValidadorIdentidadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? datosValidacion = null, Object? estadoValidacion = null}) {
    return _then(
      _$ValidadorIdentidadStateImpl(
        datosValidacion:
            null == datosValidacion
                ? _value.datosValidacion
                : datosValidacion // ignore: cast_nullable_to_non_nullable
                    as DatosValidacion,
        estadoValidacion:
            null == estadoValidacion
                ? _value.estadoValidacion
                : estadoValidacion // ignore: cast_nullable_to_non_nullable
                    as EstadoValidacion,
      ),
    );
  }
}

/// @nodoc

class _$ValidadorIdentidadStateImpl implements _ValidadorIdentidadState {
  const _$ValidadorIdentidadStateImpl({
    this.datosValidacion = const DatosValidacion(),
    this.estadoValidacion = const EstadoValidacion.inicial(),
  });

  @override
  @JsonKey()
  final DatosValidacion datosValidacion;
  @override
  @JsonKey()
  final EstadoValidacion estadoValidacion;

  @override
  String toString() {
    return 'ValidadorIdentidadState(datosValidacion: $datosValidacion, estadoValidacion: $estadoValidacion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidadorIdentidadStateImpl &&
            (identical(other.datosValidacion, datosValidacion) ||
                other.datosValidacion == datosValidacion) &&
            (identical(other.estadoValidacion, estadoValidacion) ||
                other.estadoValidacion == estadoValidacion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, datosValidacion, estadoValidacion);

  /// Create a copy of ValidadorIdentidadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidadorIdentidadStateImplCopyWith<_$ValidadorIdentidadStateImpl>
  get copyWith => __$$ValidadorIdentidadStateImplCopyWithImpl<
    _$ValidadorIdentidadStateImpl
  >(this, _$identity);
}

abstract class _ValidadorIdentidadState implements ValidadorIdentidadState {
  const factory _ValidadorIdentidadState({
    final DatosValidacion datosValidacion,
    final EstadoValidacion estadoValidacion,
  }) = _$ValidadorIdentidadStateImpl;

  @override
  DatosValidacion get datosValidacion;
  @override
  EstadoValidacion get estadoValidacion;

  /// Create a copy of ValidadorIdentidadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidadorIdentidadStateImplCopyWith<_$ValidadorIdentidadStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EstadoValidacion {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inicial,
    required TResult Function() validando,
    required TResult Function(bool validacionExitosa) validado,
    required TResult Function() error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inicial,
    TResult? Function()? validando,
    TResult? Function(bool validacionExitosa)? validado,
    TResult? Function()? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inicial,
    TResult Function()? validando,
    TResult Function(bool validacionExitosa)? validado,
    TResult Function()? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inicial value) inicial,
    required TResult Function(Validando value) validando,
    required TResult Function(Validado value) validado,
    required TResult Function(Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inicial value)? inicial,
    TResult? Function(Validando value)? validando,
    TResult? Function(Validado value)? validado,
    TResult? Function(Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inicial value)? inicial,
    TResult Function(Validando value)? validando,
    TResult Function(Validado value)? validado,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstadoValidacionCopyWith<$Res> {
  factory $EstadoValidacionCopyWith(
    EstadoValidacion value,
    $Res Function(EstadoValidacion) then,
  ) = _$EstadoValidacionCopyWithImpl<$Res, EstadoValidacion>;
}

/// @nodoc
class _$EstadoValidacionCopyWithImpl<$Res, $Val extends EstadoValidacion>
    implements $EstadoValidacionCopyWith<$Res> {
  _$EstadoValidacionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstadoValidacion
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InicialImplCopyWith<$Res> {
  factory _$$InicialImplCopyWith(
    _$InicialImpl value,
    $Res Function(_$InicialImpl) then,
  ) = __$$InicialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InicialImplCopyWithImpl<$Res>
    extends _$EstadoValidacionCopyWithImpl<$Res, _$InicialImpl>
    implements _$$InicialImplCopyWith<$Res> {
  __$$InicialImplCopyWithImpl(
    _$InicialImpl _value,
    $Res Function(_$InicialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EstadoValidacion
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InicialImpl implements Inicial {
  const _$InicialImpl();

  @override
  String toString() {
    return 'EstadoValidacion.inicial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InicialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inicial,
    required TResult Function() validando,
    required TResult Function(bool validacionExitosa) validado,
    required TResult Function() error,
  }) {
    return inicial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inicial,
    TResult? Function()? validando,
    TResult? Function(bool validacionExitosa)? validado,
    TResult? Function()? error,
  }) {
    return inicial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inicial,
    TResult Function()? validando,
    TResult Function(bool validacionExitosa)? validado,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (inicial != null) {
      return inicial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inicial value) inicial,
    required TResult Function(Validando value) validando,
    required TResult Function(Validado value) validado,
    required TResult Function(Error value) error,
  }) {
    return inicial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inicial value)? inicial,
    TResult? Function(Validando value)? validando,
    TResult? Function(Validado value)? validado,
    TResult? Function(Error value)? error,
  }) {
    return inicial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inicial value)? inicial,
    TResult Function(Validando value)? validando,
    TResult Function(Validado value)? validado,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (inicial != null) {
      return inicial(this);
    }
    return orElse();
  }
}

abstract class Inicial implements EstadoValidacion {
  const factory Inicial() = _$InicialImpl;
}

/// @nodoc
abstract class _$$ValidandoImplCopyWith<$Res> {
  factory _$$ValidandoImplCopyWith(
    _$ValidandoImpl value,
    $Res Function(_$ValidandoImpl) then,
  ) = __$$ValidandoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidandoImplCopyWithImpl<$Res>
    extends _$EstadoValidacionCopyWithImpl<$Res, _$ValidandoImpl>
    implements _$$ValidandoImplCopyWith<$Res> {
  __$$ValidandoImplCopyWithImpl(
    _$ValidandoImpl _value,
    $Res Function(_$ValidandoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EstadoValidacion
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ValidandoImpl implements Validando {
  const _$ValidandoImpl();

  @override
  String toString() {
    return 'EstadoValidacion.validando()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ValidandoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inicial,
    required TResult Function() validando,
    required TResult Function(bool validacionExitosa) validado,
    required TResult Function() error,
  }) {
    return validando();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inicial,
    TResult? Function()? validando,
    TResult? Function(bool validacionExitosa)? validado,
    TResult? Function()? error,
  }) {
    return validando?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inicial,
    TResult Function()? validando,
    TResult Function(bool validacionExitosa)? validado,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (validando != null) {
      return validando();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inicial value) inicial,
    required TResult Function(Validando value) validando,
    required TResult Function(Validado value) validado,
    required TResult Function(Error value) error,
  }) {
    return validando(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inicial value)? inicial,
    TResult? Function(Validando value)? validando,
    TResult? Function(Validado value)? validado,
    TResult? Function(Error value)? error,
  }) {
    return validando?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inicial value)? inicial,
    TResult Function(Validando value)? validando,
    TResult Function(Validado value)? validado,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (validando != null) {
      return validando(this);
    }
    return orElse();
  }
}

abstract class Validando implements EstadoValidacion {
  const factory Validando() = _$ValidandoImpl;
}

/// @nodoc
abstract class _$$ValidadoImplCopyWith<$Res> {
  factory _$$ValidadoImplCopyWith(
    _$ValidadoImpl value,
    $Res Function(_$ValidadoImpl) then,
  ) = __$$ValidadoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool validacionExitosa});
}

/// @nodoc
class __$$ValidadoImplCopyWithImpl<$Res>
    extends _$EstadoValidacionCopyWithImpl<$Res, _$ValidadoImpl>
    implements _$$ValidadoImplCopyWith<$Res> {
  __$$ValidadoImplCopyWithImpl(
    _$ValidadoImpl _value,
    $Res Function(_$ValidadoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EstadoValidacion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? validacionExitosa = null}) {
    return _then(
      _$ValidadoImpl(
        validacionExitosa:
            null == validacionExitosa
                ? _value.validacionExitosa
                : validacionExitosa // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ValidadoImpl implements Validado {
  const _$ValidadoImpl({required this.validacionExitosa});

  @override
  final bool validacionExitosa;

  @override
  String toString() {
    return 'EstadoValidacion.validado(validacionExitosa: $validacionExitosa)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidadoImpl &&
            (identical(other.validacionExitosa, validacionExitosa) ||
                other.validacionExitosa == validacionExitosa));
  }

  @override
  int get hashCode => Object.hash(runtimeType, validacionExitosa);

  /// Create a copy of EstadoValidacion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidadoImplCopyWith<_$ValidadoImpl> get copyWith =>
      __$$ValidadoImplCopyWithImpl<_$ValidadoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inicial,
    required TResult Function() validando,
    required TResult Function(bool validacionExitosa) validado,
    required TResult Function() error,
  }) {
    return validado(validacionExitosa);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inicial,
    TResult? Function()? validando,
    TResult? Function(bool validacionExitosa)? validado,
    TResult? Function()? error,
  }) {
    return validado?.call(validacionExitosa);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inicial,
    TResult Function()? validando,
    TResult Function(bool validacionExitosa)? validado,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (validado != null) {
      return validado(validacionExitosa);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inicial value) inicial,
    required TResult Function(Validando value) validando,
    required TResult Function(Validado value) validado,
    required TResult Function(Error value) error,
  }) {
    return validado(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inicial value)? inicial,
    TResult? Function(Validando value)? validando,
    TResult? Function(Validado value)? validado,
    TResult? Function(Error value)? error,
  }) {
    return validado?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inicial value)? inicial,
    TResult Function(Validando value)? validando,
    TResult Function(Validado value)? validado,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (validado != null) {
      return validado(this);
    }
    return orElse();
  }
}

abstract class Validado implements EstadoValidacion {
  const factory Validado({required final bool validacionExitosa}) =
      _$ValidadoImpl;

  bool get validacionExitosa;

  /// Create a copy of EstadoValidacion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidadoImplCopyWith<_$ValidadoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$EstadoValidacionCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EstadoValidacion
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'EstadoValidacion.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inicial,
    required TResult Function() validando,
    required TResult Function(bool validacionExitosa) validado,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inicial,
    TResult? Function()? validando,
    TResult? Function(bool validacionExitosa)? validado,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inicial,
    TResult Function()? validando,
    TResult Function(bool validacionExitosa)? validado,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Inicial value) inicial,
    required TResult Function(Validando value) validando,
    required TResult Function(Validado value) validado,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Inicial value)? inicial,
    TResult? Function(Validando value)? validando,
    TResult? Function(Validado value)? validado,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Inicial value)? inicial,
    TResult Function(Validando value)? validando,
    TResult Function(Validado value)? validado,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements EstadoValidacion {
  const factory Error() = _$ErrorImpl;
}
