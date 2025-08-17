// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resultado_ocr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ResultadoOcr {
  OrientacionDocumento get orientacion => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String numero,
      String emision,
      String expiracion,
      OrientacionDocumento orientacion,
    )
    carnetComputarizadoAnverso,
    required TResult Function(String nombre, OrientacionDocumento orientacion)
    carnetComputarizadoReverso,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String numero,
      String emision,
      String expiracion,
      OrientacionDocumento orientacion,
    )?
    carnetComputarizadoAnverso,
    TResult? Function(String nombre, OrientacionDocumento orientacion)?
    carnetComputarizadoReverso,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String numero,
      String emision,
      String expiracion,
      OrientacionDocumento orientacion,
    )?
    carnetComputarizadoAnverso,
    TResult Function(String nombre, OrientacionDocumento orientacion)?
    carnetComputarizadoReverso,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultadoOcrCarnetComputarizadoAnverso value)
    carnetComputarizadoAnverso,
    required TResult Function(_ResultadoOcrCarnetComputarizadoReverso value)
    carnetComputarizadoReverso,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultadoOcrCarnetComputarizadoAnverso value)?
    carnetComputarizadoAnverso,
    TResult? Function(_ResultadoOcrCarnetComputarizadoReverso value)?
    carnetComputarizadoReverso,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultadoOcrCarnetComputarizadoAnverso value)?
    carnetComputarizadoAnverso,
    TResult Function(_ResultadoOcrCarnetComputarizadoReverso value)?
    carnetComputarizadoReverso,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ResultadoOcr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultadoOcrCopyWith<ResultadoOcr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultadoOcrCopyWith<$Res> {
  factory $ResultadoOcrCopyWith(
    ResultadoOcr value,
    $Res Function(ResultadoOcr) then,
  ) = _$ResultadoOcrCopyWithImpl<$Res, ResultadoOcr>;
  @useResult
  $Res call({OrientacionDocumento orientacion});

  $OrientacionDocumentoCopyWith<$Res> get orientacion;
}

/// @nodoc
class _$ResultadoOcrCopyWithImpl<$Res, $Val extends ResultadoOcr>
    implements $ResultadoOcrCopyWith<$Res> {
  _$ResultadoOcrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultadoOcr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orientacion = null}) {
    return _then(
      _value.copyWith(
            orientacion:
                null == orientacion
                    ? _value.orientacion
                    : orientacion // ignore: cast_nullable_to_non_nullable
                        as OrientacionDocumento,
          )
          as $Val,
    );
  }

  /// Create a copy of ResultadoOcr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrientacionDocumentoCopyWith<$Res> get orientacion {
    return $OrientacionDocumentoCopyWith<$Res>(_value.orientacion, (value) {
      return _then(_value.copyWith(orientacion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultadoOcrCarnetComputarizadoAnversoImplCopyWith<$Res>
    implements $ResultadoOcrCopyWith<$Res> {
  factory _$$ResultadoOcrCarnetComputarizadoAnversoImplCopyWith(
    _$ResultadoOcrCarnetComputarizadoAnversoImpl value,
    $Res Function(_$ResultadoOcrCarnetComputarizadoAnversoImpl) then,
  ) = __$$ResultadoOcrCarnetComputarizadoAnversoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String numero,
    String emision,
    String expiracion,
    OrientacionDocumento orientacion,
  });

  @override
  $OrientacionDocumentoCopyWith<$Res> get orientacion;
}

/// @nodoc
class __$$ResultadoOcrCarnetComputarizadoAnversoImplCopyWithImpl<$Res>
    extends
        _$ResultadoOcrCopyWithImpl<
          $Res,
          _$ResultadoOcrCarnetComputarizadoAnversoImpl
        >
    implements _$$ResultadoOcrCarnetComputarizadoAnversoImplCopyWith<$Res> {
  __$$ResultadoOcrCarnetComputarizadoAnversoImplCopyWithImpl(
    _$ResultadoOcrCarnetComputarizadoAnversoImpl _value,
    $Res Function(_$ResultadoOcrCarnetComputarizadoAnversoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultadoOcr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numero = null,
    Object? emision = null,
    Object? expiracion = null,
    Object? orientacion = null,
  }) {
    return _then(
      _$ResultadoOcrCarnetComputarizadoAnversoImpl(
        numero:
            null == numero
                ? _value.numero
                : numero // ignore: cast_nullable_to_non_nullable
                    as String,
        emision:
            null == emision
                ? _value.emision
                : emision // ignore: cast_nullable_to_non_nullable
                    as String,
        expiracion:
            null == expiracion
                ? _value.expiracion
                : expiracion // ignore: cast_nullable_to_non_nullable
                    as String,
        orientacion:
            null == orientacion
                ? _value.orientacion
                : orientacion // ignore: cast_nullable_to_non_nullable
                    as OrientacionDocumento,
      ),
    );
  }
}

/// @nodoc

class _$ResultadoOcrCarnetComputarizadoAnversoImpl
    implements _ResultadoOcrCarnetComputarizadoAnverso {
  const _$ResultadoOcrCarnetComputarizadoAnversoImpl({
    required this.numero,
    required this.emision,
    required this.expiracion,
    this.orientacion = const OrientacionDocumento.anverso(),
  });

  @override
  final String numero;
  @override
  final String emision;
  @override
  final String expiracion;
  @override
  @JsonKey()
  final OrientacionDocumento orientacion;

  @override
  String toString() {
    return 'ResultadoOcr.carnetComputarizadoAnverso(numero: $numero, emision: $emision, expiracion: $expiracion, orientacion: $orientacion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultadoOcrCarnetComputarizadoAnversoImpl &&
            (identical(other.numero, numero) || other.numero == numero) &&
            (identical(other.emision, emision) || other.emision == emision) &&
            (identical(other.expiracion, expiracion) ||
                other.expiracion == expiracion) &&
            (identical(other.orientacion, orientacion) ||
                other.orientacion == orientacion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, numero, emision, expiracion, orientacion);

  /// Create a copy of ResultadoOcr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultadoOcrCarnetComputarizadoAnversoImplCopyWith<
    _$ResultadoOcrCarnetComputarizadoAnversoImpl
  >
  get copyWith => __$$ResultadoOcrCarnetComputarizadoAnversoImplCopyWithImpl<
    _$ResultadoOcrCarnetComputarizadoAnversoImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String numero,
      String emision,
      String expiracion,
      OrientacionDocumento orientacion,
    )
    carnetComputarizadoAnverso,
    required TResult Function(String nombre, OrientacionDocumento orientacion)
    carnetComputarizadoReverso,
  }) {
    return carnetComputarizadoAnverso(numero, emision, expiracion, orientacion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String numero,
      String emision,
      String expiracion,
      OrientacionDocumento orientacion,
    )?
    carnetComputarizadoAnverso,
    TResult? Function(String nombre, OrientacionDocumento orientacion)?
    carnetComputarizadoReverso,
  }) {
    return carnetComputarizadoAnverso?.call(
      numero,
      emision,
      expiracion,
      orientacion,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String numero,
      String emision,
      String expiracion,
      OrientacionDocumento orientacion,
    )?
    carnetComputarizadoAnverso,
    TResult Function(String nombre, OrientacionDocumento orientacion)?
    carnetComputarizadoReverso,
    required TResult orElse(),
  }) {
    if (carnetComputarizadoAnverso != null) {
      return carnetComputarizadoAnverso(
        numero,
        emision,
        expiracion,
        orientacion,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultadoOcrCarnetComputarizadoAnverso value)
    carnetComputarizadoAnverso,
    required TResult Function(_ResultadoOcrCarnetComputarizadoReverso value)
    carnetComputarizadoReverso,
  }) {
    return carnetComputarizadoAnverso(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultadoOcrCarnetComputarizadoAnverso value)?
    carnetComputarizadoAnverso,
    TResult? Function(_ResultadoOcrCarnetComputarizadoReverso value)?
    carnetComputarizadoReverso,
  }) {
    return carnetComputarizadoAnverso?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultadoOcrCarnetComputarizadoAnverso value)?
    carnetComputarizadoAnverso,
    TResult Function(_ResultadoOcrCarnetComputarizadoReverso value)?
    carnetComputarizadoReverso,
    required TResult orElse(),
  }) {
    if (carnetComputarizadoAnverso != null) {
      return carnetComputarizadoAnverso(this);
    }
    return orElse();
  }
}

abstract class _ResultadoOcrCarnetComputarizadoAnverso implements ResultadoOcr {
  const factory _ResultadoOcrCarnetComputarizadoAnverso({
    required final String numero,
    required final String emision,
    required final String expiracion,
    final OrientacionDocumento orientacion,
  }) = _$ResultadoOcrCarnetComputarizadoAnversoImpl;

  String get numero;
  String get emision;
  String get expiracion;
  @override
  OrientacionDocumento get orientacion;

  /// Create a copy of ResultadoOcr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultadoOcrCarnetComputarizadoAnversoImplCopyWith<
    _$ResultadoOcrCarnetComputarizadoAnversoImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultadoOcrCarnetComputarizadoReversoImplCopyWith<$Res>
    implements $ResultadoOcrCopyWith<$Res> {
  factory _$$ResultadoOcrCarnetComputarizadoReversoImplCopyWith(
    _$ResultadoOcrCarnetComputarizadoReversoImpl value,
    $Res Function(_$ResultadoOcrCarnetComputarizadoReversoImpl) then,
  ) = __$$ResultadoOcrCarnetComputarizadoReversoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nombre, OrientacionDocumento orientacion});

  @override
  $OrientacionDocumentoCopyWith<$Res> get orientacion;
}

/// @nodoc
class __$$ResultadoOcrCarnetComputarizadoReversoImplCopyWithImpl<$Res>
    extends
        _$ResultadoOcrCopyWithImpl<
          $Res,
          _$ResultadoOcrCarnetComputarizadoReversoImpl
        >
    implements _$$ResultadoOcrCarnetComputarizadoReversoImplCopyWith<$Res> {
  __$$ResultadoOcrCarnetComputarizadoReversoImplCopyWithImpl(
    _$ResultadoOcrCarnetComputarizadoReversoImpl _value,
    $Res Function(_$ResultadoOcrCarnetComputarizadoReversoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultadoOcr
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nombre = null, Object? orientacion = null}) {
    return _then(
      _$ResultadoOcrCarnetComputarizadoReversoImpl(
        nombre:
            null == nombre
                ? _value.nombre
                : nombre // ignore: cast_nullable_to_non_nullable
                    as String,
        orientacion:
            null == orientacion
                ? _value.orientacion
                : orientacion // ignore: cast_nullable_to_non_nullable
                    as OrientacionDocumento,
      ),
    );
  }
}

/// @nodoc

class _$ResultadoOcrCarnetComputarizadoReversoImpl
    implements _ResultadoOcrCarnetComputarizadoReverso {
  const _$ResultadoOcrCarnetComputarizadoReversoImpl({
    required this.nombre,
    this.orientacion = const OrientacionDocumento.reverso(),
  });

  @override
  final String nombre;
  @override
  @JsonKey()
  final OrientacionDocumento orientacion;

  @override
  String toString() {
    return 'ResultadoOcr.carnetComputarizadoReverso(nombre: $nombre, orientacion: $orientacion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultadoOcrCarnetComputarizadoReversoImpl &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.orientacion, orientacion) ||
                other.orientacion == orientacion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nombre, orientacion);

  /// Create a copy of ResultadoOcr
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultadoOcrCarnetComputarizadoReversoImplCopyWith<
    _$ResultadoOcrCarnetComputarizadoReversoImpl
  >
  get copyWith => __$$ResultadoOcrCarnetComputarizadoReversoImplCopyWithImpl<
    _$ResultadoOcrCarnetComputarizadoReversoImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String numero,
      String emision,
      String expiracion,
      OrientacionDocumento orientacion,
    )
    carnetComputarizadoAnverso,
    required TResult Function(String nombre, OrientacionDocumento orientacion)
    carnetComputarizadoReverso,
  }) {
    return carnetComputarizadoReverso(nombre, orientacion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String numero,
      String emision,
      String expiracion,
      OrientacionDocumento orientacion,
    )?
    carnetComputarizadoAnverso,
    TResult? Function(String nombre, OrientacionDocumento orientacion)?
    carnetComputarizadoReverso,
  }) {
    return carnetComputarizadoReverso?.call(nombre, orientacion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String numero,
      String emision,
      String expiracion,
      OrientacionDocumento orientacion,
    )?
    carnetComputarizadoAnverso,
    TResult Function(String nombre, OrientacionDocumento orientacion)?
    carnetComputarizadoReverso,
    required TResult orElse(),
  }) {
    if (carnetComputarizadoReverso != null) {
      return carnetComputarizadoReverso(nombre, orientacion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultadoOcrCarnetComputarizadoAnverso value)
    carnetComputarizadoAnverso,
    required TResult Function(_ResultadoOcrCarnetComputarizadoReverso value)
    carnetComputarizadoReverso,
  }) {
    return carnetComputarizadoReverso(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultadoOcrCarnetComputarizadoAnverso value)?
    carnetComputarizadoAnverso,
    TResult? Function(_ResultadoOcrCarnetComputarizadoReverso value)?
    carnetComputarizadoReverso,
  }) {
    return carnetComputarizadoReverso?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultadoOcrCarnetComputarizadoAnverso value)?
    carnetComputarizadoAnverso,
    TResult Function(_ResultadoOcrCarnetComputarizadoReverso value)?
    carnetComputarizadoReverso,
    required TResult orElse(),
  }) {
    if (carnetComputarizadoReverso != null) {
      return carnetComputarizadoReverso(this);
    }
    return orElse();
  }
}

abstract class _ResultadoOcrCarnetComputarizadoReverso implements ResultadoOcr {
  const factory _ResultadoOcrCarnetComputarizadoReverso({
    required final String nombre,
    final OrientacionDocumento orientacion,
  }) = _$ResultadoOcrCarnetComputarizadoReversoImpl;

  String get nombre;
  @override
  OrientacionDocumento get orientacion;

  /// Create a copy of ResultadoOcr
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultadoOcrCarnetComputarizadoReversoImplCopyWith<
    _$ResultadoOcrCarnetComputarizadoReversoImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
