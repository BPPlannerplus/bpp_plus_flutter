// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewList _$ReviewListFromJson(Map<String, dynamic> json) {
  return _ReviewList.fromJson(json);
}

/// @nodoc
class _$ReviewListTearOff {
  const _$ReviewListTearOff();

  _ReviewList call(
      {@JsonKey(name: 'results') required List<Review> reviews,
      required String next}) {
    return _ReviewList(
      reviews: reviews,
      next: next,
    );
  }

  ReviewList fromJson(Map<String, Object?> json) {
    return ReviewList.fromJson(json);
  }
}

/// @nodoc
const $ReviewList = _$ReviewListTearOff();

/// @nodoc
mixin _$ReviewList {
  @JsonKey(name: 'results')
  List<Review> get reviews => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewListCopyWith<ReviewList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewListCopyWith<$Res> {
  factory $ReviewListCopyWith(
          ReviewList value, $Res Function(ReviewList) then) =
      _$ReviewListCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'results') List<Review> reviews, String next});
}

/// @nodoc
class _$ReviewListCopyWithImpl<$Res> implements $ReviewListCopyWith<$Res> {
  _$ReviewListCopyWithImpl(this._value, this._then);

  final ReviewList _value;
  // ignore: unused_field
  final $Res Function(ReviewList) _then;

  @override
  $Res call({
    Object? reviews = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      reviews: reviews == freezed
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReviewListCopyWith<$Res> implements $ReviewListCopyWith<$Res> {
  factory _$ReviewListCopyWith(
          _ReviewList value, $Res Function(_ReviewList) then) =
      __$ReviewListCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'results') List<Review> reviews, String next});
}

/// @nodoc
class __$ReviewListCopyWithImpl<$Res> extends _$ReviewListCopyWithImpl<$Res>
    implements _$ReviewListCopyWith<$Res> {
  __$ReviewListCopyWithImpl(
      _ReviewList _value, $Res Function(_ReviewList) _then)
      : super(_value, (v) => _then(v as _ReviewList));

  @override
  _ReviewList get _value => super._value as _ReviewList;

  @override
  $Res call({
    Object? reviews = freezed,
    Object? next = freezed,
  }) {
    return _then(_ReviewList(
      reviews: reviews == freezed
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewList implements _ReviewList {
  _$_ReviewList(
      {@JsonKey(name: 'results') required this.reviews, required this.next});

  factory _$_ReviewList.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewListFromJson(json);

  @override
  @JsonKey(name: 'results')
  final List<Review> reviews;
  @override
  final String next;

  @override
  String toString() {
    return 'ReviewList(reviews: $reviews, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewList &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            (identical(other.next, next) || other.next == next));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(reviews), next);

  @JsonKey(ignore: true)
  @override
  _$ReviewListCopyWith<_ReviewList> get copyWith =>
      __$ReviewListCopyWithImpl<_ReviewList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewListToJson(this);
  }
}

abstract class _ReviewList implements ReviewList {
  factory _ReviewList(
      {@JsonKey(name: 'results') required List<Review> reviews,
      required String next}) = _$_ReviewList;

  factory _ReviewList.fromJson(Map<String, dynamic> json) =
      _$_ReviewList.fromJson;

  @override
  @JsonKey(name: 'results')
  List<Review> get reviews;
  @override
  String get next;
  @override
  @JsonKey(ignore: true)
  _$ReviewListCopyWith<_ReviewList> get copyWith =>
      throw _privateConstructorUsedError;
}
