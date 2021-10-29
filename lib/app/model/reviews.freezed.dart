// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reviews.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reviews _$ReviewsFromJson(Map<String, dynamic> json) {
  return _Reviews.fromJson(json);
}

/// @nodoc
class _$ReviewsTearOff {
  const _$ReviewsTearOff();

  _Reviews call({required List<Review> reviews, required String next}) {
    return _Reviews(
      reviews: reviews,
      next: next,
    );
  }

  Reviews fromJson(Map<String, Object?> json) {
    return Reviews.fromJson(json);
  }
}

/// @nodoc
const $Reviews = _$ReviewsTearOff();

/// @nodoc
mixin _$Reviews {
  List<Review> get reviews => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewsCopyWith<Reviews> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsCopyWith<$Res> {
  factory $ReviewsCopyWith(Reviews value, $Res Function(Reviews) then) =
      _$ReviewsCopyWithImpl<$Res>;
  $Res call({List<Review> reviews, String next});
}

/// @nodoc
class _$ReviewsCopyWithImpl<$Res> implements $ReviewsCopyWith<$Res> {
  _$ReviewsCopyWithImpl(this._value, this._then);

  final Reviews _value;
  // ignore: unused_field
  final $Res Function(Reviews) _then;

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
abstract class _$ReviewsCopyWith<$Res> implements $ReviewsCopyWith<$Res> {
  factory _$ReviewsCopyWith(_Reviews value, $Res Function(_Reviews) then) =
      __$ReviewsCopyWithImpl<$Res>;
  @override
  $Res call({List<Review> reviews, String next});
}

/// @nodoc
class __$ReviewsCopyWithImpl<$Res> extends _$ReviewsCopyWithImpl<$Res>
    implements _$ReviewsCopyWith<$Res> {
  __$ReviewsCopyWithImpl(_Reviews _value, $Res Function(_Reviews) _then)
      : super(_value, (v) => _then(v as _Reviews));

  @override
  _Reviews get _value => super._value as _Reviews;

  @override
  $Res call({
    Object? reviews = freezed,
    Object? next = freezed,
  }) {
    return _then(_Reviews(
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
class _$_Reviews implements _Reviews {
  _$_Reviews({required this.reviews, required this.next});

  factory _$_Reviews.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewsFromJson(json);

  @override
  final List<Review> reviews;
  @override
  final String next;

  @override
  String toString() {
    return 'Reviews(reviews: $reviews, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reviews &&
            const DeepCollectionEquality().equals(other.reviews, reviews) &&
            (identical(other.next, next) || other.next == next));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(reviews), next);

  @JsonKey(ignore: true)
  @override
  _$ReviewsCopyWith<_Reviews> get copyWith =>
      __$ReviewsCopyWithImpl<_Reviews>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewsToJson(this);
  }
}

abstract class _Reviews implements Reviews {
  factory _Reviews({required List<Review> reviews, required String next}) =
      _$_Reviews;

  factory _Reviews.fromJson(Map<String, dynamic> json) = _$_Reviews.fromJson;

  @override
  List<Review> get reviews;
  @override
  String get next;
  @override
  @JsonKey(ignore: true)
  _$ReviewsCopyWith<_Reviews> get copyWith =>
      throw _privateConstructorUsedError;
}
