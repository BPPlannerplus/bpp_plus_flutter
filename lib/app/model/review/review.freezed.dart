// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
class _$ReviewTearOff {
  const _$ReviewTearOff();

  _Review call(
      {required int id,
      required User user,
      required int score,
      required String contents,
      required String date}) {
    return _Review(
      id: id,
      user: user,
      score: score,
      contents: contents,
      date: date,
    );
  }

  Review fromJson(Map<String, Object?> json) {
    return Review.fromJson(json);
  }
}

/// @nodoc
const $Review = _$ReviewTearOff();

/// @nodoc
mixin _$Review {
  int get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res>;
  $Res call({int id, User user, int score, String contents, String date});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res> implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  final Review _value;
  // ignore: unused_field
  final $Res Function(Review) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? score = freezed,
    Object? contents = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) then) =
      __$ReviewCopyWithImpl<$Res>;
  @override
  $Res call({int id, User user, int score, String contents, String date});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$ReviewCopyWithImpl<$Res> extends _$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(_Review _value, $Res Function(_Review) _then)
      : super(_value, (v) => _then(v as _Review));

  @override
  _Review get _value => super._value as _Review;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? score = freezed,
    Object? contents = freezed,
    Object? date = freezed,
  }) {
    return _then(_Review(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Review implements _Review {
  _$_Review(
      {required this.id,
      required this.user,
      required this.score,
      required this.contents,
      required this.date});

  factory _$_Review.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewFromJson(json);

  @override
  final int id;
  @override
  final User user;
  @override
  final int score;
  @override
  final String contents;
  @override
  final String date;

  @override
  String toString() {
    return 'Review(id: $id, user: $user, score: $score, contents: $contents, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Review &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, user, score, contents, date);

  @JsonKey(ignore: true)
  @override
  _$ReviewCopyWith<_Review> get copyWith =>
      __$ReviewCopyWithImpl<_Review>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewToJson(this);
  }
}

abstract class _Review implements Review {
  factory _Review(
      {required int id,
      required User user,
      required int score,
      required String contents,
      required String date}) = _$_Review;

  factory _Review.fromJson(Map<String, dynamic> json) = _$_Review.fromJson;

  @override
  int get id;
  @override
  User get user;
  @override
  int get score;
  @override
  String get contents;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$ReviewCopyWith<_Review> get copyWith => throw _privateConstructorUsedError;
}

ReviewRequest _$ReviewRequestFromJson(Map<String, dynamic> json) {
  return _ReviewRequest.fromJson(json);
}

/// @nodoc
class _$ReviewRequestTearOff {
  const _$ReviewRequestTearOff();

  _ReviewRequest call({int? score, required String contents}) {
    return _ReviewRequest(
      score: score,
      contents: contents,
    );
  }

  ReviewRequest fromJson(Map<String, Object?> json) {
    return ReviewRequest.fromJson(json);
  }
}

/// @nodoc
const $ReviewRequest = _$ReviewRequestTearOff();

/// @nodoc
mixin _$ReviewRequest {
  int? get score => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewRequestCopyWith<ReviewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewRequestCopyWith<$Res> {
  factory $ReviewRequestCopyWith(
          ReviewRequest value, $Res Function(ReviewRequest) then) =
      _$ReviewRequestCopyWithImpl<$Res>;
  $Res call({int? score, String contents});
}

/// @nodoc
class _$ReviewRequestCopyWithImpl<$Res>
    implements $ReviewRequestCopyWith<$Res> {
  _$ReviewRequestCopyWithImpl(this._value, this._then);

  final ReviewRequest _value;
  // ignore: unused_field
  final $Res Function(ReviewRequest) _then;

  @override
  $Res call({
    Object? score = freezed,
    Object? contents = freezed,
  }) {
    return _then(_value.copyWith(
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReviewRequestCopyWith<$Res>
    implements $ReviewRequestCopyWith<$Res> {
  factory _$ReviewRequestCopyWith(
          _ReviewRequest value, $Res Function(_ReviewRequest) then) =
      __$ReviewRequestCopyWithImpl<$Res>;
  @override
  $Res call({int? score, String contents});
}

/// @nodoc
class __$ReviewRequestCopyWithImpl<$Res>
    extends _$ReviewRequestCopyWithImpl<$Res>
    implements _$ReviewRequestCopyWith<$Res> {
  __$ReviewRequestCopyWithImpl(
      _ReviewRequest _value, $Res Function(_ReviewRequest) _then)
      : super(_value, (v) => _then(v as _ReviewRequest));

  @override
  _ReviewRequest get _value => super._value as _ReviewRequest;

  @override
  $Res call({
    Object? score = freezed,
    Object? contents = freezed,
  }) {
    return _then(_ReviewRequest(
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewRequest implements _ReviewRequest {
  _$_ReviewRequest({this.score, required this.contents});

  factory _$_ReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewRequestFromJson(json);

  @override
  final int? score;
  @override
  final String contents;

  @override
  String toString() {
    return 'ReviewRequest(score: $score, contents: $contents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewRequest &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @override
  int get hashCode => Object.hash(runtimeType, score, contents);

  @JsonKey(ignore: true)
  @override
  _$ReviewRequestCopyWith<_ReviewRequest> get copyWith =>
      __$ReviewRequestCopyWithImpl<_ReviewRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewRequestToJson(this);
  }
}

abstract class _ReviewRequest implements ReviewRequest {
  factory _ReviewRequest({int? score, required String contents}) =
      _$_ReviewRequest;

  factory _ReviewRequest.fromJson(Map<String, dynamic> json) =
      _$_ReviewRequest.fromJson;

  @override
  int? get score;
  @override
  String get contents;
  @override
  @JsonKey(ignore: true)
  _$ReviewRequestCopyWith<_ReviewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
