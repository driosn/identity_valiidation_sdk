// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resultado_orientacion_facial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ResultadoOrientacionFacial {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrientacionFacial orientacionFacial)
    caraEncontrada,
    required TResult Function() caraNoEncontrada,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrientacionFacial orientacionFacial)? caraEncontrada,
    TResult? Function()? caraNoEncontrada,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrientacionFacial orientacionFacial)? caraEncontrada,
    TResult Function()? caraNoEncontrada,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultadoOrientacionFacialCaraEncontrada value)
    caraEncontrada,
    required TResult Function(_ResultadoOrientacionFacialCaraNoEncontrada value)
    caraNoEncontrada,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultadoOrientacionFacialCaraEncontrada value)?
    caraEncontrada,
    TResult? Function(_ResultadoOrientacionFacialCaraNoEncontrada value)?
    caraNoEncontrada,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultadoOrientacionFacialCaraEncontrada value)?
    caraEncontrada,
    TResult Function(_ResultadoOrientacionFacialCaraNoEncontrada value)?
    caraNoEncontrada,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultadoOrientacionFacialCopyWith<$Res> {
  factory $ResultadoOrientacionFacialCopyWith(
    ResultadoOrientacionFacial value,
    $Res Function(ResultadoOrientacionFacial) then,
  ) =
      _$ResultadoOrientacionFacialCopyWithImpl<
        $Res,
        ResultadoOrientacionFacial
      >;
}

/// @nodoc
class _$ResultadoOrientacionFacialCopyWithImpl<
  $Res,
  $Val extends ResultadoOrientacionFacial
>
    implements $ResultadoOrientacionFacialCopyWith<$Res> {
  _$ResultadoOrientacionFacialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultadoOrientacionFacial
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResultadoOrientacionFacialCaraEncontradaImplCopyWith<$Res> {
  factory _$$ResultadoOrientacionFacialCaraEncontradaImplCopyWith(
    _$ResultadoOrientacionFacialCaraEncontradaImpl value,
    $Res Function(_$ResultadoOrientacionFacialCaraEncontradaImpl) then,
  ) = __$$ResultadoOrientacionFacialCaraEncontradaImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrientacionFacial orientacionFacial});

  $OrientacionFacialCopyWith<$Res> get orientacionFacial;
}

/// @nodoc
class __$$ResultadoOrientacionFacialCaraEncontradaImplCopyWithImpl<$Res>
    extends
        _$ResultadoOrientacionFacialCopyWithImpl<
          $Res,
          _$ResultadoOrientacionFacialCaraEncontradaImpl
        >
    implements _$$ResultadoOrientacionFacialCaraEncontradaImplCopyWith<$Res> {
  __$$ResultadoOrientacionFacialCaraEncontradaImplCopyWithImpl(
    _$ResultadoOrientacionFacialCaraEncontradaImpl _value,
    $Res Function(_$ResultadoOrientacionFacialCaraEncontradaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultadoOrientacionFacial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orientacionFacial = null}) {
    return _then(
      _$ResultadoOrientacionFacialCaraEncontradaImpl(
        orientacionFacial:
            null == orientacionFacial
                ? _value.orientacionFacial
                : orientacionFacial // ignore: cast_nullable_to_non_nullable
                    as OrientacionFacial,
      ),
    );
  }

  /// Create a copy of ResultadoOrientacionFacial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrientacionFacialCopyWith<$Res> get orientacionFacial {
    return $OrientacionFacialCopyWith<$Res>(_value.orientacionFacial, (value) {
      return _then(_value.copyWith(orientacionFacial: value));
    });
  }
}

/// @nodoc

class _$ResultadoOrientacionFacialCaraEncontradaImpl
    implements _ResultadoOrientacionFacialCaraEncontrada {
  const _$ResultadoOrientacionFacialCaraEncontradaImpl({
    required this.orientacionFacial,
  });

  @override
  final OrientacionFacial orientacionFacial;

  @override
  String toString() {
    return 'ResultadoOrientacionFacial.caraEncontrada(orientacionFacial: $orientacionFacial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultadoOrientacionFacialCaraEncontradaImpl &&
            (identical(other.orientacionFacial, orientacionFacial) ||
                other.orientacionFacial == orientacionFacial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orientacionFacial);

  /// Create a copy of ResultadoOrientacionFacial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultadoOrientacionFacialCaraEncontradaImplCopyWith<
    _$ResultadoOrientacionFacialCaraEncontradaImpl
  >
  get copyWith => __$$ResultadoOrientacionFacialCaraEncontradaImplCopyWithImpl<
    _$ResultadoOrientacionFacialCaraEncontradaImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrientacionFacial orientacionFacial)
    caraEncontrada,
    required TResult Function() caraNoEncontrada,
  }) {
    return caraEncontrada(orientacionFacial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrientacionFacial orientacionFacial)? caraEncontrada,
    TResult? Function()? caraNoEncontrada,
  }) {
    return caraEncontrada?.call(orientacionFacial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrientacionFacial orientacionFacial)? caraEncontrada,
    TResult Function()? caraNoEncontrada,
    required TResult orElse(),
  }) {
    if (caraEncontrada != null) {
      return caraEncontrada(orientacionFacial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultadoOrientacionFacialCaraEncontrada value)
    caraEncontrada,
    required TResult Function(_ResultadoOrientacionFacialCaraNoEncontrada value)
    caraNoEncontrada,
  }) {
    return caraEncontrada(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultadoOrientacionFacialCaraEncontrada value)?
    caraEncontrada,
    TResult? Function(_ResultadoOrientacionFacialCaraNoEncontrada value)?
    caraNoEncontrada,
  }) {
    return caraEncontrada?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultadoOrientacionFacialCaraEncontrada value)?
    caraEncontrada,
    TResult Function(_ResultadoOrientacionFacialCaraNoEncontrada value)?
    caraNoEncontrada,
    required TResult orElse(),
  }) {
    if (caraEncontrada != null) {
      return caraEncontrada(this);
    }
    return orElse();
  }
}

abstract class _ResultadoOrientacionFacialCaraEncontrada
    implements ResultadoOrientacionFacial {
  const factory _ResultadoOrientacionFacialCaraEncontrada({
    required final OrientacionFacial orientacionFacial,
  }) = _$ResultadoOrientacionFacialCaraEncontradaImpl;

  OrientacionFacial get orientacionFacial;

  /// Create a copy of ResultadoOrientacionFacial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultadoOrientacionFacialCaraEncontradaImplCopyWith<
    _$ResultadoOrientacionFacialCaraEncontradaImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultadoOrientacionFacialCaraNoEncontradaImplCopyWith<$Res> {
  factory _$$ResultadoOrientacionFacialCaraNoEncontradaImplCopyWith(
    _$ResultadoOrientacionFacialCaraNoEncontradaImpl value,
    $Res Function(_$ResultadoOrientacionFacialCaraNoEncontradaImpl) then,
  ) = __$$ResultadoOrientacionFacialCaraNoEncontradaImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResultadoOrientacionFacialCaraNoEncontradaImplCopyWithImpl<$Res>
    extends
        _$ResultadoOrientacionFacialCopyWithImpl<
          $Res,
          _$ResultadoOrientacionFacialCaraNoEncontradaImpl
        >
    implements _$$ResultadoOrientacionFacialCaraNoEncontradaImplCopyWith<$Res> {
  __$$ResultadoOrientacionFacialCaraNoEncontradaImplCopyWithImpl(
    _$ResultadoOrientacionFacialCaraNoEncontradaImpl _value,
    $Res Function(_$ResultadoOrientacionFacialCaraNoEncontradaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultadoOrientacionFacial
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResultadoOrientacionFacialCaraNoEncontradaImpl
    implements _ResultadoOrientacionFacialCaraNoEncontrada {
  const _$ResultadoOrientacionFacialCaraNoEncontradaImpl();

  @override
  String toString() {
    return 'ResultadoOrientacionFacial.caraNoEncontrada()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultadoOrientacionFacialCaraNoEncontradaImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrientacionFacial orientacionFacial)
    caraEncontrada,
    required TResult Function() caraNoEncontrada,
  }) {
    return caraNoEncontrada();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrientacionFacial orientacionFacial)? caraEncontrada,
    TResult? Function()? caraNoEncontrada,
  }) {
    return caraNoEncontrada?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrientacionFacial orientacionFacial)? caraEncontrada,
    TResult Function()? caraNoEncontrada,
    required TResult orElse(),
  }) {
    if (caraNoEncontrada != null) {
      return caraNoEncontrada();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultadoOrientacionFacialCaraEncontrada value)
    caraEncontrada,
    required TResult Function(_ResultadoOrientacionFacialCaraNoEncontrada value)
    caraNoEncontrada,
  }) {
    return caraNoEncontrada(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultadoOrientacionFacialCaraEncontrada value)?
    caraEncontrada,
    TResult? Function(_ResultadoOrientacionFacialCaraNoEncontrada value)?
    caraNoEncontrada,
  }) {
    return caraNoEncontrada?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultadoOrientacionFacialCaraEncontrada value)?
    caraEncontrada,
    TResult Function(_ResultadoOrientacionFacialCaraNoEncontrada value)?
    caraNoEncontrada,
    required TResult orElse(),
  }) {
    if (caraNoEncontrada != null) {
      return caraNoEncontrada(this);
    }
    return orElse();
  }
}

abstract class _ResultadoOrientacionFacialCaraNoEncontrada
    implements ResultadoOrientacionFacial {
  const factory _ResultadoOrientacionFacialCaraNoEncontrada() =
      _$ResultadoOrientacionFacialCaraNoEncontradaImpl;
}
