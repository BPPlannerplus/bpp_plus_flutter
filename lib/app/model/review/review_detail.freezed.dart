// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewDetail _$ReviewDetailFromJson(Map<String, dynamic> json) {
  return _ReviewDetail.fromJson(json);
}

/// @nodoc
class _$ReviewDetailTearOff {
  const _$ReviewDetailTearOff();

  _ReviewDetail call(
      {required int id,
      @JsonKey(name: 'created_at') required String createdAt,
      @JsonKey(name: 'updated_dt') required String updatedDt,
      required int score,
      required String contents,
      required String date,
      @JsonKey(name: 'user') required int userId,
      @JsonKey(name: 'shop') required int shopId}) {
    return _ReviewDetail(
      id: id,
      createdAt: createdAt,
      updatedDt: updatedDt,
      score: score,
      contents: contents,
      date: date,
      userId: userId,
      shopId: shopId,
    );
  }

  ReviewDetail fromJson(Map<String, Object?> json) {
    return ReviewDetail.fromJson(json);
  }
}

/// @nodoc
const $ReviewDetail = _$ReviewDetailTearOff();

/// @nodoc
mixin _$ReviewDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_dt')
  String get updatedDt => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop')
  int get shopId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewDetailCopyWith<ReviewDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDetailCopyWith<$Res> {
  factory $ReviewDetailCopyWith(
          ReviewDetail value, $Res Function(ReviewDetail) then) =
      _$ReviewDetailCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_dt') String updatedDt,
      int score,
      String contents,
      String date,
      @JsonKey(name: 'user') int userId,
      @JsonKey(name: 'shop') int shopId});
}

/// @nodoc
class _$ReviewDetailCopyWithImpl<$Res> implements $ReviewDetailCopyWith<$Res> {
  _$ReviewDetailCopyWithImpl(this._value, this._then);

  final ReviewDetail _value;
  // ignore: unused_field
  final $Res Function(ReviewDetail) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedDt = freezed,
    Object? score = freezed,
    Object? contents = freezed,
    Object? date = freezed,
    Object? userId = freezed,
    Object? shopId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDt: updatedDt == freezed
          ? _value.updatedDt
          : updatedDt // ignore: cast_nullable_to_non_nullable
              as String,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: shopId == freezed
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ReviewDetailCopyWith<$Res>
    implements $ReviewDetailCopyWith<$Res> {
  factory _$ReviewDetailCopyWith(
          _ReviewDetail value, $Res Function(_ReviewDetail) then) =
      __$ReviewDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_dt') String updatedDt,
      int score,
      String contents,
      String date,
      @JsonKey(name: 'user') int userId,
      @JsonKey(name: 'shop') int shopId});
}

/// @nodoc
class __$ReviewDetailCopyWithImpl<$Res> extends _$ReviewDetailCopyWithImpl<$Res>
    implements _$ReviewDetailCopyWith<$Res> {
  __$ReviewDetailCopyWithImpl(
      _ReviewDetail _value, $Res Function(_ReviewDetail) _then)
      : super(_value, (v) => _then(v as _ReviewDetail));

  @override
  _ReviewDetail get _value => super._value as _ReviewDetail;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedDt = freezed,
    Object? score = freezed,
    Object? contents = freezed,
    Object? date = freezed,
    Object? userId = freezed,
    Object? shopId = freezed,
  }) {
    return _then(_ReviewDetail(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDt: updatedDt == freezed
          ? _value.updatedDt
          : updatedDt // ignore: cast_nullable_to_non_nullable
              as String,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: shopId == freezed
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewDetail implements _ReviewDetail {
  _$_ReviewDetail(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_dt') required this.updatedDt,
      required this.score,
      required this.contents,
      required this.date,
      @JsonKey(name: 'user') required this.userId,
      @JsonKey(name: 'shop') required this.shopId});

  factory _$_ReviewDetail.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewDetailFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_dt')
  final String updatedDt;
  @override
  final int score;
  @override
  final String contents;
  @override
  final String date;
  @override
  @JsonKey(name: 'user')
  final int userId;
  @override
  @JsonKey(name: 'shop')
  final int shopId;

  @override
  String toString() {
    return 'ReviewDetail(id: $id, createdAt: $createdAt, updatedDt: $updatedDt, score: $score, contents: $contents, date: $date, userId: $userId, shopId: $shopId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedDt, updatedDt) ||
                other.updatedDt == updatedDt) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.shopId, shopId) || other.shopId == shopId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedDt, score,
      contents, date, userId, shopId);

  @JsonKey(ignore: true)
  @override
  _$ReviewDetailCopyWith<_ReviewDetail> get copyWith =>
      __$ReviewDetailCopyWithImpl<_ReviewDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewDetailToJson(this);
  }
}

abstract class _ReviewDetail implements ReviewDetail {
  factory _ReviewDetail(
      {required int id,
      @JsonKey(name: 'created_at') required String createdAt,
      @JsonKey(name: 'updated_dt') required String updatedDt,
      required int score,
      required String contents,
      required String date,
      @JsonKey(name: 'user') required int userId,
      @JsonKey(name: 'shop') required int shopId}) = _$_ReviewDetail;

  factory _ReviewDetail.fromJson(Map<String, dynamic> json) =
      _$_ReviewDetail.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_dt')
  String get updatedDt;
  @override
  int get score;
  @override
  String get contents;
  @override
  String get date;
  @override
  @JsonKey(name: 'user')
  int get userId;
  @override
  @JsonKey(name: 'shop')
  int get shopId;
  @override
  @JsonKey(ignore: true)
  _$ReviewDetailCopyWith<_ReviewDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewContent _$ReviewContentFromJson(Map<String, dynamic> json) {
  return _ReviewContent.fromJson(json);
}

/// @nodoc
class _$ReviewContentTearOff {
  const _$ReviewContentTearOff();

  _ReviewContent call({required String contents}) {
    return _ReviewContent(
      contents: contents,
    );
  }

  ReviewContent fromJson(Map<String, Object?> json) {
    return ReviewContent.fromJson(json);
  }
}

/// @nodoc
const $ReviewContent = _$ReviewContentTearOff();

/// @nodoc
mixin _$ReviewContent {
  String get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewContentCopyWith<ReviewContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewContentCopyWith<$Res> {
  factory $ReviewContentCopyWith(
          ReviewContent value, $Res Function(ReviewContent) then) =
      _$ReviewContentCopyWithImpl<$Res>;
  $Res call({String contents});
}

/// @nodoc
class _$ReviewContentCopyWithImpl<$Res>
    implements $ReviewContentCopyWith<$Res> {
  _$ReviewContentCopyWithImpl(this._value, this._then);

  final ReviewContent _value;
  // ignore: unused_field
  final $Res Function(ReviewContent) _then;

  @override
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_value.copyWith(
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReviewContentCopyWith<$Res>
    implements $ReviewContentCopyWith<$Res> {
  factory _$ReviewContentCopyWith(
          _ReviewContent value, $Res Function(_ReviewContent) then) =
      __$ReviewContentCopyWithImpl<$Res>;
  @override
  $Res call({String contents});
}

/// @nodoc
class __$ReviewContentCopyWithImpl<$Res>
    extends _$ReviewContentCopyWithImpl<$Res>
    implements _$ReviewContentCopyWith<$Res> {
  __$ReviewContentCopyWithImpl(
      _ReviewContent _value, $Res Function(_ReviewContent) _then)
      : super(_value, (v) => _then(v as _ReviewContent));

  @override
  _ReviewContent get _value => super._value as _ReviewContent;

  @override
  $Res call({
    Object? contents = freezed,
  }) {
    return _then(_ReviewContent(
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewContent implements _ReviewContent {
  _$_ReviewContent({required this.contents});

  factory _$_ReviewContent.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewContentFromJson(json);

  @override
  final String contents;

  @override
  String toString() {
    return 'ReviewContent(contents: $contents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewContent &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contents);

  @JsonKey(ignore: true)
  @override
  _$ReviewContentCopyWith<_ReviewContent> get copyWith =>
      __$ReviewContentCopyWithImpl<_ReviewContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewContentToJson(this);
  }
}

abstract class _ReviewContent implements ReviewContent {
  factory _ReviewContent({required String contents}) = _$_ReviewContent;

  factory _ReviewContent.fromJson(Map<String, dynamic> json) =
      _$_ReviewContent.fromJson;

  @override
  String get contents;
  @override
  @JsonKey(ignore: true)
  _$ReviewContentCopyWith<_ReviewContent> get copyWith =>
      throw _privateConstructorUsedError;
}
