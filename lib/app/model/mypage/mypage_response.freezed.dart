// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mypage_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MypageResponse _$MypageResponseFromJson(Map<String, dynamic> json) {
  return _MypageResponse.fromJson(json);
}

/// @nodoc
class _$MypageResponseTearOff {
  const _$MypageResponseTearOff();

  _MypageResponse call(
      {@JsonKey(name: 'remaining_days') required int remainingDays,
      @JsonKey(name: 'results') required List<MypageData> list}) {
    return _MypageResponse(
      remainingDays: remainingDays,
      list: list,
    );
  }

  MypageResponse fromJson(Map<String, Object?> json) {
    return MypageResponse.fromJson(json);
  }
}

/// @nodoc
const $MypageResponse = _$MypageResponseTearOff();

/// @nodoc
mixin _$MypageResponse {
  @JsonKey(name: 'remaining_days')
  int get remainingDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<MypageData> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MypageResponseCopyWith<MypageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MypageResponseCopyWith<$Res> {
  factory $MypageResponseCopyWith(
          MypageResponse value, $Res Function(MypageResponse) then) =
      _$MypageResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'remaining_days') int remainingDays,
      @JsonKey(name: 'results') List<MypageData> list});
}

/// @nodoc
class _$MypageResponseCopyWithImpl<$Res>
    implements $MypageResponseCopyWith<$Res> {
  _$MypageResponseCopyWithImpl(this._value, this._then);

  final MypageResponse _value;
  // ignore: unused_field
  final $Res Function(MypageResponse) _then;

  @override
  $Res call({
    Object? remainingDays = freezed,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      remainingDays: remainingDays == freezed
          ? _value.remainingDays
          : remainingDays // ignore: cast_nullable_to_non_nullable
              as int,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<MypageData>,
    ));
  }
}

/// @nodoc
abstract class _$MypageResponseCopyWith<$Res>
    implements $MypageResponseCopyWith<$Res> {
  factory _$MypageResponseCopyWith(
          _MypageResponse value, $Res Function(_MypageResponse) then) =
      __$MypageResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'remaining_days') int remainingDays,
      @JsonKey(name: 'results') List<MypageData> list});
}

/// @nodoc
class __$MypageResponseCopyWithImpl<$Res>
    extends _$MypageResponseCopyWithImpl<$Res>
    implements _$MypageResponseCopyWith<$Res> {
  __$MypageResponseCopyWithImpl(
      _MypageResponse _value, $Res Function(_MypageResponse) _then)
      : super(_value, (v) => _then(v as _MypageResponse));

  @override
  _MypageResponse get _value => super._value as _MypageResponse;

  @override
  $Res call({
    Object? remainingDays = freezed,
    Object? list = freezed,
  }) {
    return _then(_MypageResponse(
      remainingDays: remainingDays == freezed
          ? _value.remainingDays
          : remainingDays // ignore: cast_nullable_to_non_nullable
              as int,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<MypageData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MypageResponse implements _MypageResponse {
  _$_MypageResponse(
      {@JsonKey(name: 'remaining_days') required this.remainingDays,
      @JsonKey(name: 'results') required this.list});

  factory _$_MypageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MypageResponseFromJson(json);

  @override
  @JsonKey(name: 'remaining_days')
  final int remainingDays;
  @override
  @JsonKey(name: 'results')
  final List<MypageData> list;

  @override
  String toString() {
    return 'MypageResponse(remainingDays: $remainingDays, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MypageResponse &&
            (identical(other.remainingDays, remainingDays) ||
                other.remainingDays == remainingDays) &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, remainingDays, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$MypageResponseCopyWith<_MypageResponse> get copyWith =>
      __$MypageResponseCopyWithImpl<_MypageResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MypageResponseToJson(this);
  }
}

abstract class _MypageResponse implements MypageResponse {
  factory _MypageResponse(
          {@JsonKey(name: 'remaining_days') required int remainingDays,
          @JsonKey(name: 'results') required List<MypageData> list}) =
      _$_MypageResponse;

  factory _MypageResponse.fromJson(Map<String, dynamic> json) =
      _$_MypageResponse.fromJson;

  @override
  @JsonKey(name: 'remaining_days')
  int get remainingDays;
  @override
  @JsonKey(name: 'results')
  List<MypageData> get list;
  @override
  @JsonKey(ignore: true)
  _$MypageResponseCopyWith<_MypageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
