// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_concept.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopConcepts _$ShopConceptsFromJson(Map<String, dynamic> json) {
  return _ShopConcepts.fromJson(json);
}

/// @nodoc
class _$ShopConceptsTearOff {
  const _$ShopConceptsTearOff();

  _ShopConcepts call(
      {required List<ShopConcept> shopConcepts, required String next}) {
    return _ShopConcepts(
      shopConcepts: shopConcepts,
      next: next,
    );
  }

  ShopConcepts fromJson(Map<String, Object?> json) {
    return ShopConcepts.fromJson(json);
  }
}

/// @nodoc
const $ShopConcepts = _$ShopConceptsTearOff();

/// @nodoc
mixin _$ShopConcepts {
  List<ShopConcept> get shopConcepts => throw _privateConstructorUsedError;
  String get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopConceptsCopyWith<ShopConcepts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopConceptsCopyWith<$Res> {
  factory $ShopConceptsCopyWith(
          ShopConcepts value, $Res Function(ShopConcepts) then) =
      _$ShopConceptsCopyWithImpl<$Res>;
  $Res call({List<ShopConcept> shopConcepts, String next});
}

/// @nodoc
class _$ShopConceptsCopyWithImpl<$Res> implements $ShopConceptsCopyWith<$Res> {
  _$ShopConceptsCopyWithImpl(this._value, this._then);

  final ShopConcepts _value;
  // ignore: unused_field
  final $Res Function(ShopConcepts) _then;

  @override
  $Res call({
    Object? shopConcepts = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      shopConcepts: shopConcepts == freezed
          ? _value.shopConcepts
          : shopConcepts // ignore: cast_nullable_to_non_nullable
              as List<ShopConcept>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ShopConceptsCopyWith<$Res>
    implements $ShopConceptsCopyWith<$Res> {
  factory _$ShopConceptsCopyWith(
          _ShopConcepts value, $Res Function(_ShopConcepts) then) =
      __$ShopConceptsCopyWithImpl<$Res>;
  @override
  $Res call({List<ShopConcept> shopConcepts, String next});
}

/// @nodoc
class __$ShopConceptsCopyWithImpl<$Res> extends _$ShopConceptsCopyWithImpl<$Res>
    implements _$ShopConceptsCopyWith<$Res> {
  __$ShopConceptsCopyWithImpl(
      _ShopConcepts _value, $Res Function(_ShopConcepts) _then)
      : super(_value, (v) => _then(v as _ShopConcepts));

  @override
  _ShopConcepts get _value => super._value as _ShopConcepts;

  @override
  $Res call({
    Object? shopConcepts = freezed,
    Object? next = freezed,
  }) {
    return _then(_ShopConcepts(
      shopConcepts: shopConcepts == freezed
          ? _value.shopConcepts
          : shopConcepts // ignore: cast_nullable_to_non_nullable
              as List<ShopConcept>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopConcepts implements _ShopConcepts {
  _$_ShopConcepts({required this.shopConcepts, required this.next});

  factory _$_ShopConcepts.fromJson(Map<String, dynamic> json) =>
      _$$_ShopConceptsFromJson(json);

  @override
  final List<ShopConcept> shopConcepts;
  @override
  final String next;

  @override
  String toString() {
    return 'ShopConcepts(shopConcepts: $shopConcepts, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopConcepts &&
            const DeepCollectionEquality()
                .equals(other.shopConcepts, shopConcepts) &&
            (identical(other.next, next) || other.next == next));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(shopConcepts), next);

  @JsonKey(ignore: true)
  @override
  _$ShopConceptsCopyWith<_ShopConcepts> get copyWith =>
      __$ShopConceptsCopyWithImpl<_ShopConcepts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopConceptsToJson(this);
  }
}

abstract class _ShopConcepts implements ShopConcepts {
  factory _ShopConcepts(
      {required List<ShopConcept> shopConcepts,
      required String next}) = _$_ShopConcepts;

  factory _ShopConcepts.fromJson(Map<String, dynamic> json) =
      _$_ShopConcepts.fromJson;

  @override
  List<ShopConcept> get shopConcepts;
  @override
  String get next;
  @override
  @JsonKey(ignore: true)
  _$ShopConceptsCopyWith<_ShopConcepts> get copyWith =>
      throw _privateConstructorUsedError;
}

ShopConcept _$ShopConceptFromJson(Map<String, dynamic> json) {
  return _ShopConcept.fromJson(json);
}

/// @nodoc
class _$ShopConceptTearOff {
  const _$ShopConceptTearOff();

  _ShopConcept call({required int id, required String profile}) {
    return _ShopConcept(
      id: id,
      profile: profile,
    );
  }

  ShopConcept fromJson(Map<String, Object?> json) {
    return ShopConcept.fromJson(json);
  }
}

/// @nodoc
const $ShopConcept = _$ShopConceptTearOff();

/// @nodoc
mixin _$ShopConcept {
  int get id => throw _privateConstructorUsedError;
  String get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopConceptCopyWith<ShopConcept> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopConceptCopyWith<$Res> {
  factory $ShopConceptCopyWith(
          ShopConcept value, $Res Function(ShopConcept) then) =
      _$ShopConceptCopyWithImpl<$Res>;
  $Res call({int id, String profile});
}

/// @nodoc
class _$ShopConceptCopyWithImpl<$Res> implements $ShopConceptCopyWith<$Res> {
  _$ShopConceptCopyWithImpl(this._value, this._then);

  final ShopConcept _value;
  // ignore: unused_field
  final $Res Function(ShopConcept) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ShopConceptCopyWith<$Res>
    implements $ShopConceptCopyWith<$Res> {
  factory _$ShopConceptCopyWith(
          _ShopConcept value, $Res Function(_ShopConcept) then) =
      __$ShopConceptCopyWithImpl<$Res>;
  @override
  $Res call({int id, String profile});
}

/// @nodoc
class __$ShopConceptCopyWithImpl<$Res> extends _$ShopConceptCopyWithImpl<$Res>
    implements _$ShopConceptCopyWith<$Res> {
  __$ShopConceptCopyWithImpl(
      _ShopConcept _value, $Res Function(_ShopConcept) _then)
      : super(_value, (v) => _then(v as _ShopConcept));

  @override
  _ShopConcept get _value => super._value as _ShopConcept;

  @override
  $Res call({
    Object? id = freezed,
    Object? profile = freezed,
  }) {
    return _then(_ShopConcept(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopConcept implements _ShopConcept {
  _$_ShopConcept({required this.id, required this.profile});

  factory _$_ShopConcept.fromJson(Map<String, dynamic> json) =>
      _$$_ShopConceptFromJson(json);

  @override
  final int id;
  @override
  final String profile;

  @override
  String toString() {
    return 'ShopConcept(id: $id, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopConcept &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, profile);

  @JsonKey(ignore: true)
  @override
  _$ShopConceptCopyWith<_ShopConcept> get copyWith =>
      __$ShopConceptCopyWithImpl<_ShopConcept>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopConceptToJson(this);
  }
}

abstract class _ShopConcept implements ShopConcept {
  factory _ShopConcept({required int id, required String profile}) =
      _$_ShopConcept;

  factory _ShopConcept.fromJson(Map<String, dynamic> json) =
      _$_ShopConcept.fromJson;

  @override
  int get id;
  @override
  String get profile;
  @override
  @JsonKey(ignore: true)
  _$ShopConceptCopyWith<_ShopConcept> get copyWith =>
      throw _privateConstructorUsedError;
}
