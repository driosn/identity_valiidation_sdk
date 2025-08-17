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
  $Res call({DatosValidacion datosValidacion});

  $DatosValidacionCopyWith<$Res> get datosValidacion;
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
  $Res call({Object? datosValidacion = null}) {
    return _then(
      _value.copyWith(
            datosValidacion:
                null == datosValidacion
                    ? _value.datosValidacion
                    : datosValidacion // ignore: cast_nullable_to_non_nullable
                        as DatosValidacion,
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
  $Res call({DatosValidacion datosValidacion});

  @override
  $DatosValidacionCopyWith<$Res> get datosValidacion;
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
  $Res call({Object? datosValidacion = null}) {
    return _then(
      _$ValidadorIdentidadStateImpl(
        datosValidacion:
            null == datosValidacion
                ? _value.datosValidacion
                : datosValidacion // ignore: cast_nullable_to_non_nullable
                    as DatosValidacion,
      ),
    );
  }
}

/// @nodoc

class _$ValidadorIdentidadStateImpl implements _ValidadorIdentidadState {
  const _$ValidadorIdentidadStateImpl({
    this.datosValidacion = const DatosValidacion(),
  });

  @override
  @JsonKey()
  final DatosValidacion datosValidacion;

  @override
  String toString() {
    return 'ValidadorIdentidadState(datosValidacion: $datosValidacion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidadorIdentidadStateImpl &&
            (identical(other.datosValidacion, datosValidacion) ||
                other.datosValidacion == datosValidacion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, datosValidacion);

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
  }) = _$ValidadorIdentidadStateImpl;

  @override
  DatosValidacion get datosValidacion;

  /// Create a copy of ValidadorIdentidadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidadorIdentidadStateImplCopyWith<_$ValidadorIdentidadStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
