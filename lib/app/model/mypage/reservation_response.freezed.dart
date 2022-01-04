// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reservation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReservationResponse _$ReservationResponseFromJson(Map<String, dynamic> json) {
  return _ReservationReseponse.fromJson(json);
}

/// @nodoc
class _$ReservationResponseTearOff {
  const _$ReservationResponseTearOff();

  _ReservationReseponse call(
      {@JsonKey(name: 'reservation id') required int reservationId}) {
    return _ReservationReseponse(
      reservationId: reservationId,
    );
  }

  ReservationResponse fromJson(Map<String, Object?> json) {
    return ReservationResponse.fromJson(json);
  }
}

/// @nodoc
const $ReservationResponse = _$ReservationResponseTearOff();

/// @nodoc
mixin _$ReservationResponse {
  @JsonKey(name: 'reservation id')
  int get reservationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationResponseCopyWith<ReservationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationResponseCopyWith<$Res> {
  factory $ReservationResponseCopyWith(
          ReservationResponse value, $Res Function(ReservationResponse) then) =
      _$ReservationResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'reservation id') int reservationId});
}

/// @nodoc
class _$ReservationResponseCopyWithImpl<$Res>
    implements $ReservationResponseCopyWith<$Res> {
  _$ReservationResponseCopyWithImpl(this._value, this._then);

  final ReservationResponse _value;
  // ignore: unused_field
  final $Res Function(ReservationResponse) _then;

  @override
  $Res call({
    Object? reservationId = freezed,
  }) {
    return _then(_value.copyWith(
      reservationId: reservationId == freezed
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ReservationReseponseCopyWith<$Res>
    implements $ReservationResponseCopyWith<$Res> {
  factory _$ReservationReseponseCopyWith(_ReservationReseponse value,
          $Res Function(_ReservationReseponse) then) =
      __$ReservationReseponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'reservation id') int reservationId});
}

/// @nodoc
class __$ReservationReseponseCopyWithImpl<$Res>
    extends _$ReservationResponseCopyWithImpl<$Res>
    implements _$ReservationReseponseCopyWith<$Res> {
  __$ReservationReseponseCopyWithImpl(
      _ReservationReseponse _value, $Res Function(_ReservationReseponse) _then)
      : super(_value, (v) => _then(v as _ReservationReseponse));

  @override
  _ReservationReseponse get _value => super._value as _ReservationReseponse;

  @override
  $Res call({
    Object? reservationId = freezed,
  }) {
    return _then(_ReservationReseponse(
      reservationId: reservationId == freezed
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReservationReseponse implements _ReservationReseponse {
  _$_ReservationReseponse(
      {@JsonKey(name: 'reservation id') required this.reservationId});

  factory _$_ReservationReseponse.fromJson(Map<String, dynamic> json) =>
      _$$_ReservationReseponseFromJson(json);

  @override
  @JsonKey(name: 'reservation id')
  final int reservationId;

  @override
  String toString() {
    return 'ReservationResponse(reservationId: $reservationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationReseponse &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reservationId);

  @JsonKey(ignore: true)
  @override
  _$ReservationReseponseCopyWith<_ReservationReseponse> get copyWith =>
      __$ReservationReseponseCopyWithImpl<_ReservationReseponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationReseponseToJson(this);
  }
}

abstract class _ReservationReseponse implements ReservationResponse {
  factory _ReservationReseponse(
          {@JsonKey(name: 'reservation id') required int reservationId}) =
      _$_ReservationReseponse;

  factory _ReservationReseponse.fromJson(Map<String, dynamic> json) =
      _$_ReservationReseponse.fromJson;

  @override
  @JsonKey(name: 'reservation id')
  int get reservationId;
  @override
  @JsonKey(ignore: true)
  _$ReservationReseponseCopyWith<_ReservationReseponse> get copyWith =>
      throw _privateConstructorUsedError;
}
