// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reservation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReservationRequest _$ReservationRequestFromJson(Map<String, dynamic> json) {
  return _ReservationRequest.fromJson(json);
}

/// @nodoc
class _$ReservationRequestTearOff {
  const _$ReservationRequestTearOff();

  _ReservationRequest call(
      {@JsonKey(name: 'reserved_date') required String date}) {
    return _ReservationRequest(
      date: date,
    );
  }

  ReservationRequest fromJson(Map<String, Object?> json) {
    return ReservationRequest.fromJson(json);
  }
}

/// @nodoc
const $ReservationRequest = _$ReservationRequestTearOff();

/// @nodoc
mixin _$ReservationRequest {
  @JsonKey(name: 'reserved_date')
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationRequestCopyWith<ReservationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationRequestCopyWith<$Res> {
  factory $ReservationRequestCopyWith(
          ReservationRequest value, $Res Function(ReservationRequest) then) =
      _$ReservationRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'reserved_date') String date});
}

/// @nodoc
class _$ReservationRequestCopyWithImpl<$Res>
    implements $ReservationRequestCopyWith<$Res> {
  _$ReservationRequestCopyWithImpl(this._value, this._then);

  final ReservationRequest _value;
  // ignore: unused_field
  final $Res Function(ReservationRequest) _then;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReservationRequestCopyWith<$Res>
    implements $ReservationRequestCopyWith<$Res> {
  factory _$ReservationRequestCopyWith(
          _ReservationRequest value, $Res Function(_ReservationRequest) then) =
      __$ReservationRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'reserved_date') String date});
}

/// @nodoc
class __$ReservationRequestCopyWithImpl<$Res>
    extends _$ReservationRequestCopyWithImpl<$Res>
    implements _$ReservationRequestCopyWith<$Res> {
  __$ReservationRequestCopyWithImpl(
      _ReservationRequest _value, $Res Function(_ReservationRequest) _then)
      : super(_value, (v) => _then(v as _ReservationRequest));

  @override
  _ReservationRequest get _value => super._value as _ReservationRequest;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_ReservationRequest(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReservationRequest implements _ReservationRequest {
  _$_ReservationRequest({@JsonKey(name: 'reserved_date') required this.date});

  factory _$_ReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ReservationRequestFromJson(json);

  @override
  @JsonKey(name: 'reserved_date')
  final String date;

  @override
  String toString() {
    return 'ReservationRequest(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReservationRequest &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  _$ReservationRequestCopyWith<_ReservationRequest> get copyWith =>
      __$ReservationRequestCopyWithImpl<_ReservationRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationRequestToJson(this);
  }
}

abstract class _ReservationRequest implements ReservationRequest {
  factory _ReservationRequest(
          {@JsonKey(name: 'reserved_date') required String date}) =
      _$_ReservationRequest;

  factory _ReservationRequest.fromJson(Map<String, dynamic> json) =
      _$_ReservationRequest.fromJson;

  @override
  @JsonKey(name: 'reserved_date')
  String get date;
  @override
  @JsonKey(ignore: true)
  _$ReservationRequestCopyWith<_ReservationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
