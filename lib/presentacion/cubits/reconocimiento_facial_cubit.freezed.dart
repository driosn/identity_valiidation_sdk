// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reconocimiento_facial_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ReconocimientoFacialState {
  EstadoProcesamiento get estadoProcesamiento =>
      throw _privateConstructorUsedError;
  OrientacionFacial get orientacionFacialEsperada =>
      throw _privateConstructorUsedError;
  int get contadorVerificacionesCorrectas => throw _privateConstructorUsedError;

  /// Create a copy of ReconocimientoFacialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReconocimientoFacialStateCopyWith<ReconocimientoFacialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReconocimientoFacialStateCopyWith<$Res> {
  factory $ReconocimientoFacialStateCopyWith(
    ReconocimientoFacialState value,
    $Res Function(ReconocimientoFacialState) then,
  ) = _$ReconocimientoFacialStateCopyWithImpl<$Res, ReconocimientoFacialState>;
  @useResult
  $Res call({
    EstadoProcesamiento estadoProcesamiento,
    OrientacionFacial orientacionFacialEsperada,
    int contadorVerificacionesCorrectas,
  });

  $EstadoProcesamientoCopyWith<$Res> get estadoProcesamiento;
  $OrientacionFacialCopyWith<$Res> get orientacionFacialEsperada;
}

/// @nodoc
class _$ReconocimientoFacialStateCopyWithImpl<
  $Res,
  $Val extends ReconocimientoFacialState
>
    implements $ReconocimientoFacialStateCopyWith<$Res> {
  _$ReconocimientoFacialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReconocimientoFacialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estadoProcesamiento = null,
    Object? orientacionFacialEsperada = null,
    Object? contadorVerificacionesCorrectas = null,
  }) {
    return _then(
      _value.copyWith(
            estadoProcesamiento:
                null == estadoProcesamiento
                    ? _value.estadoProcesamiento
                    : estadoProcesamiento // ignore: cast_nullable_to_non_nullable
                        as EstadoProcesamiento,
            orientacionFacialEsperada:
                null == orientacionFacialEsperada
                    ? _value.orientacionFacialEsperada
                    : orientacionFacialEsperada // ignore: cast_nullable_to_non_nullable
                        as OrientacionFacial,
            contadorVerificacionesCorrectas:
                null == contadorVerificacionesCorrectas
                    ? _value.contadorVerificacionesCorrectas
                    : contadorVerificacionesCorrectas // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }

  /// Create a copy of ReconocimientoFacialState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstadoProcesamientoCopyWith<$Res> get estadoProcesamiento {
    return $EstadoProcesamientoCopyWith<$Res>(_value.estadoProcesamiento, (
      value,
    ) {
      return _then(_value.copyWith(estadoProcesamiento: value) as $Val);
    });
  }

  /// Create a copy of ReconocimientoFacialState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrientacionFacialCopyWith<$Res> get orientacionFacialEsperada {
    return $OrientacionFacialCopyWith<$Res>(_value.orientacionFacialEsperada, (
      value,
    ) {
      return _then(_value.copyWith(orientacionFacialEsperada: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReconocimientoFacialStateImplCopyWith<$Res>
    implements $ReconocimientoFacialStateCopyWith<$Res> {
  factory _$$ReconocimientoFacialStateImplCopyWith(
    _$ReconocimientoFacialStateImpl value,
    $Res Function(_$ReconocimientoFacialStateImpl) then,
  ) = __$$ReconocimientoFacialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EstadoProcesamiento estadoProcesamiento,
    OrientacionFacial orientacionFacialEsperada,
    int contadorVerificacionesCorrectas,
  });

  @override
  $EstadoProcesamientoCopyWith<$Res> get estadoProcesamiento;
  @override
  $OrientacionFacialCopyWith<$Res> get orientacionFacialEsperada;
}

/// @nodoc
class __$$ReconocimientoFacialStateImplCopyWithImpl<$Res>
    extends
        _$ReconocimientoFacialStateCopyWithImpl<
          $Res,
          _$ReconocimientoFacialStateImpl
        >
    implements _$$ReconocimientoFacialStateImplCopyWith<$Res> {
  __$$ReconocimientoFacialStateImplCopyWithImpl(
    _$ReconocimientoFacialStateImpl _value,
    $Res Function(_$ReconocimientoFacialStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReconocimientoFacialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estadoProcesamiento = null,
    Object? orientacionFacialEsperada = null,
    Object? contadorVerificacionesCorrectas = null,
  }) {
    return _then(
      _$ReconocimientoFacialStateImpl(
        estadoProcesamiento:
            null == estadoProcesamiento
                ? _value.estadoProcesamiento
                : estadoProcesamiento // ignore: cast_nullable_to_non_nullable
                    as EstadoProcesamiento,
        orientacionFacialEsperada:
            null == orientacionFacialEsperada
                ? _value.orientacionFacialEsperada
                : orientacionFacialEsperada // ignore: cast_nullable_to_non_nullable
                    as OrientacionFacial,
        contadorVerificacionesCorrectas:
            null == contadorVerificacionesCorrectas
                ? _value.contadorVerificacionesCorrectas
                : contadorVerificacionesCorrectas // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$ReconocimientoFacialStateImpl implements _ReconocimientoFacialState {
  const _$ReconocimientoFacialStateImpl({
    required this.estadoProcesamiento,
    required this.orientacionFacialEsperada,
    required this.contadorVerificacionesCorrectas,
  });

  @override
  final EstadoProcesamiento estadoProcesamiento;
  @override
  final OrientacionFacial orientacionFacialEsperada;
  @override
  final int contadorVerificacionesCorrectas;

  @override
  String toString() {
    return 'ReconocimientoFacialState(estadoProcesamiento: $estadoProcesamiento, orientacionFacialEsperada: $orientacionFacialEsperada, contadorVerificacionesCorrectas: $contadorVerificacionesCorrectas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReconocimientoFacialStateImpl &&
            (identical(other.estadoProcesamiento, estadoProcesamiento) ||
                other.estadoProcesamiento == estadoProcesamiento) &&
            (identical(
                  other.orientacionFacialEsperada,
                  orientacionFacialEsperada,
                ) ||
                other.orientacionFacialEsperada == orientacionFacialEsperada) &&
            (identical(
                  other.contadorVerificacionesCorrectas,
                  contadorVerificacionesCorrectas,
                ) ||
                other.contadorVerificacionesCorrectas ==
                    contadorVerificacionesCorrectas));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    estadoProcesamiento,
    orientacionFacialEsperada,
    contadorVerificacionesCorrectas,
  );

  /// Create a copy of ReconocimientoFacialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReconocimientoFacialStateImplCopyWith<_$ReconocimientoFacialStateImpl>
  get copyWith => __$$ReconocimientoFacialStateImplCopyWithImpl<
    _$ReconocimientoFacialStateImpl
  >(this, _$identity);
}

abstract class _ReconocimientoFacialState implements ReconocimientoFacialState {
  const factory _ReconocimientoFacialState({
    required final EstadoProcesamiento estadoProcesamiento,
    required final OrientacionFacial orientacionFacialEsperada,
    required final int contadorVerificacionesCorrectas,
  }) = _$ReconocimientoFacialStateImpl;

  @override
  EstadoProcesamiento get estadoProcesamiento;
  @override
  OrientacionFacial get orientacionFacialEsperada;
  @override
  int get contadorVerificacionesCorrectas;

  /// Create a copy of ReconocimientoFacialState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReconocimientoFacialStateImplCopyWith<_$ReconocimientoFacialStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EstadoProcesamiento {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() procesando,
    required TResult Function() noProcesando,
    required TResult Function(File fotoVerificacionFacial) completado,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? procesando,
    TResult? Function()? noProcesando,
    TResult? Function(File fotoVerificacionFacial)? completado,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? procesando,
    TResult Function()? noProcesando,
    TResult Function(File fotoVerificacionFacial)? completado,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Procesando value) procesando,
    required TResult Function(_NoProcesando value) noProcesando,
    required TResult Function(_Completado value) completado,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Procesando value)? procesando,
    TResult? Function(_NoProcesando value)? noProcesando,
    TResult? Function(_Completado value)? completado,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Procesando value)? procesando,
    TResult Function(_NoProcesando value)? noProcesando,
    TResult Function(_Completado value)? completado,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstadoProcesamientoCopyWith<$Res> {
  factory $EstadoProcesamientoCopyWith(
    EstadoProcesamiento value,
    $Res Function(EstadoProcesamiento) then,
  ) = _$EstadoProcesamientoCopyWithImpl<$Res, EstadoProcesamiento>;
}

/// @nodoc
class _$EstadoProcesamientoCopyWithImpl<$Res, $Val extends EstadoProcesamiento>
    implements $EstadoProcesamientoCopyWith<$Res> {
  _$EstadoProcesamientoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstadoProcesamiento
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProcesandoImplCopyWith<$Res> {
  factory _$$ProcesandoImplCopyWith(
    _$ProcesandoImpl value,
    $Res Function(_$ProcesandoImpl) then,
  ) = __$$ProcesandoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcesandoImplCopyWithImpl<$Res>
    extends _$EstadoProcesamientoCopyWithImpl<$Res, _$ProcesandoImpl>
    implements _$$ProcesandoImplCopyWith<$Res> {
  __$$ProcesandoImplCopyWithImpl(
    _$ProcesandoImpl _value,
    $Res Function(_$ProcesandoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EstadoProcesamiento
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProcesandoImpl implements _Procesando {
  const _$ProcesandoImpl();

  @override
  String toString() {
    return 'EstadoProcesamiento.procesando()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcesandoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() procesando,
    required TResult Function() noProcesando,
    required TResult Function(File fotoVerificacionFacial) completado,
  }) {
    return procesando();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? procesando,
    TResult? Function()? noProcesando,
    TResult? Function(File fotoVerificacionFacial)? completado,
  }) {
    return procesando?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? procesando,
    TResult Function()? noProcesando,
    TResult Function(File fotoVerificacionFacial)? completado,
    required TResult orElse(),
  }) {
    if (procesando != null) {
      return procesando();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Procesando value) procesando,
    required TResult Function(_NoProcesando value) noProcesando,
    required TResult Function(_Completado value) completado,
  }) {
    return procesando(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Procesando value)? procesando,
    TResult? Function(_NoProcesando value)? noProcesando,
    TResult? Function(_Completado value)? completado,
  }) {
    return procesando?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Procesando value)? procesando,
    TResult Function(_NoProcesando value)? noProcesando,
    TResult Function(_Completado value)? completado,
    required TResult orElse(),
  }) {
    if (procesando != null) {
      return procesando(this);
    }
    return orElse();
  }
}

abstract class _Procesando implements EstadoProcesamiento {
  const factory _Procesando() = _$ProcesandoImpl;
}

/// @nodoc
abstract class _$$NoProcesandoImplCopyWith<$Res> {
  factory _$$NoProcesandoImplCopyWith(
    _$NoProcesandoImpl value,
    $Res Function(_$NoProcesandoImpl) then,
  ) = __$$NoProcesandoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoProcesandoImplCopyWithImpl<$Res>
    extends _$EstadoProcesamientoCopyWithImpl<$Res, _$NoProcesandoImpl>
    implements _$$NoProcesandoImplCopyWith<$Res> {
  __$$NoProcesandoImplCopyWithImpl(
    _$NoProcesandoImpl _value,
    $Res Function(_$NoProcesandoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EstadoProcesamiento
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoProcesandoImpl implements _NoProcesando {
  const _$NoProcesandoImpl();

  @override
  String toString() {
    return 'EstadoProcesamiento.noProcesando()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoProcesandoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() procesando,
    required TResult Function() noProcesando,
    required TResult Function(File fotoVerificacionFacial) completado,
  }) {
    return noProcesando();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? procesando,
    TResult? Function()? noProcesando,
    TResult? Function(File fotoVerificacionFacial)? completado,
  }) {
    return noProcesando?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? procesando,
    TResult Function()? noProcesando,
    TResult Function(File fotoVerificacionFacial)? completado,
    required TResult orElse(),
  }) {
    if (noProcesando != null) {
      return noProcesando();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Procesando value) procesando,
    required TResult Function(_NoProcesando value) noProcesando,
    required TResult Function(_Completado value) completado,
  }) {
    return noProcesando(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Procesando value)? procesando,
    TResult? Function(_NoProcesando value)? noProcesando,
    TResult? Function(_Completado value)? completado,
  }) {
    return noProcesando?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Procesando value)? procesando,
    TResult Function(_NoProcesando value)? noProcesando,
    TResult Function(_Completado value)? completado,
    required TResult orElse(),
  }) {
    if (noProcesando != null) {
      return noProcesando(this);
    }
    return orElse();
  }
}

abstract class _NoProcesando implements EstadoProcesamiento {
  const factory _NoProcesando() = _$NoProcesandoImpl;
}

/// @nodoc
abstract class _$$CompletadoImplCopyWith<$Res> {
  factory _$$CompletadoImplCopyWith(
    _$CompletadoImpl value,
    $Res Function(_$CompletadoImpl) then,
  ) = __$$CompletadoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File fotoVerificacionFacial});
}

/// @nodoc
class __$$CompletadoImplCopyWithImpl<$Res>
    extends _$EstadoProcesamientoCopyWithImpl<$Res, _$CompletadoImpl>
    implements _$$CompletadoImplCopyWith<$Res> {
  __$$CompletadoImplCopyWithImpl(
    _$CompletadoImpl _value,
    $Res Function(_$CompletadoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EstadoProcesamiento
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fotoVerificacionFacial = null}) {
    return _then(
      _$CompletadoImpl(
        fotoVerificacionFacial:
            null == fotoVerificacionFacial
                ? _value.fotoVerificacionFacial
                : fotoVerificacionFacial // ignore: cast_nullable_to_non_nullable
                    as File,
      ),
    );
  }
}

/// @nodoc

class _$CompletadoImpl implements _Completado {
  const _$CompletadoImpl({required this.fotoVerificacionFacial});

  @override
  final File fotoVerificacionFacial;

  @override
  String toString() {
    return 'EstadoProcesamiento.completado(fotoVerificacionFacial: $fotoVerificacionFacial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletadoImpl &&
            (identical(other.fotoVerificacionFacial, fotoVerificacionFacial) ||
                other.fotoVerificacionFacial == fotoVerificacionFacial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fotoVerificacionFacial);

  /// Create a copy of EstadoProcesamiento
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletadoImplCopyWith<_$CompletadoImpl> get copyWith =>
      __$$CompletadoImplCopyWithImpl<_$CompletadoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() procesando,
    required TResult Function() noProcesando,
    required TResult Function(File fotoVerificacionFacial) completado,
  }) {
    return completado(fotoVerificacionFacial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? procesando,
    TResult? Function()? noProcesando,
    TResult? Function(File fotoVerificacionFacial)? completado,
  }) {
    return completado?.call(fotoVerificacionFacial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? procesando,
    TResult Function()? noProcesando,
    TResult Function(File fotoVerificacionFacial)? completado,
    required TResult orElse(),
  }) {
    if (completado != null) {
      return completado(fotoVerificacionFacial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Procesando value) procesando,
    required TResult Function(_NoProcesando value) noProcesando,
    required TResult Function(_Completado value) completado,
  }) {
    return completado(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Procesando value)? procesando,
    TResult? Function(_NoProcesando value)? noProcesando,
    TResult? Function(_Completado value)? completado,
  }) {
    return completado?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Procesando value)? procesando,
    TResult Function(_NoProcesando value)? noProcesando,
    TResult Function(_Completado value)? completado,
    required TResult orElse(),
  }) {
    if (completado != null) {
      return completado(this);
    }
    return orElse();
  }
}

abstract class _Completado implements EstadoProcesamiento {
  const factory _Completado({required final File fotoVerificacionFacial}) =
      _$CompletadoImpl;

  File get fotoVerificacionFacial;

  /// Create a copy of EstadoProcesamiento
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompletadoImplCopyWith<_$CompletadoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
