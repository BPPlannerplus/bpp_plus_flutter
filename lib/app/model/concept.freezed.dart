// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'concept.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Concept _$ConceptFromJson(Map<String, dynamic> json) {
  return _Concept.fromJson(json);
}

/// @nodoc
class _$ConceptTearOff {
  const _$ConceptTearOff();

  _Concept call(
      {required int id,
      required String profile,
      required IdNamePair shop,
      required bool like}) {
    return _Concept(
      id: id,
      profile: profile,
      shop: shop,
      like: like,
    );
  }

  Concept fromJson(Map<String, Object?> json) {
    return Concept.fromJson(json);
  }
}

/// @nodoc
const $Concept = _$ConceptTearOff();

/// @nodoc
mixin _$Concept {
  int get id => throw _privateConstructorUsedError;
  String get profile => throw _privateConstructorUsedError;
  IdNamePair get shop => throw _privateConstructorUsedError;
  bool get like => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConceptCopyWith<Concept> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptCopyWith<$Res> {
  factory $ConceptCopyWith(Concept value, $Res Function(Concept) then) =
      _$ConceptCopyWithImpl<$Res>;
  $Res call({int id, String profile, IdNamePair shop, bool like});

  $IdNamePairCopyWith<$Res> get shop;
}

/// @nodoc
class _$ConceptCopyWithImpl<$Res> implements $ConceptCopyWith<$Res> {
  _$ConceptCopyWithImpl(this._value, this._then);

  final Concept _value;
  // ignore: unused_field
  final $Res Function(Concept) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? profile = freezed,
    Object? shop = freezed,
    Object? like = freezed,
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
      shop: shop == freezed
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as IdNamePair,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $IdNamePairCopyWith<$Res> get shop {
    return $IdNamePairCopyWith<$Res>(_value.shop, (value) {
      return _then(_value.copyWith(shop: value));
    });
  }
}

/// @nodoc
abstract class _$ConceptCopyWith<$Res> implements $ConceptCopyWith<$Res> {
  factory _$ConceptCopyWith(_Concept value, $Res Function(_Concept) then) =
      __$ConceptCopyWithImpl<$Res>;
  @override
  $Res call({int id, String profile, IdNamePair shop, bool like});

  @override
  $IdNamePairCopyWith<$Res> get shop;
}

/// @nodoc
class __$ConceptCopyWithImpl<$Res> extends _$ConceptCopyWithImpl<$Res>
    implements _$ConceptCopyWith<$Res> {
  __$ConceptCopyWithImpl(_Concept _value, $Res Function(_Concept) _then)
      : super(_value, (v) => _then(v as _Concept));

  @override
  _Concept get _value => super._value as _Concept;

  @override
  $Res call({
    Object? id = freezed,
    Object? profile = freezed,
    Object? shop = freezed,
    Object? like = freezed,
  }) {
    return _then(_Concept(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
      shop: shop == freezed
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as IdNamePair,
      like: like == freezed
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Concept implements _Concept {
  _$_Concept(
      {required this.id,
      required this.profile,
      required this.shop,
      required this.like});

  factory _$_Concept.fromJson(Map<String, dynamic> json) =>
      _$$_ConceptFromJson(json);

  @override
  final int id;
  @override
  final String profile;
  @override
  final IdNamePair shop;
  @override
  final bool like;

  @override
  String toString() {
    return 'Concept(id: $id, profile: $profile, shop: $shop, like: $like)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Concept &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.shop, shop) || other.shop == shop) &&
            (identical(other.like, like) || other.like == like));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, profile, shop, like);

  @JsonKey(ignore: true)
  @override
  _$ConceptCopyWith<_Concept> get copyWith =>
      __$ConceptCopyWithImpl<_Concept>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConceptToJson(this);
  }
}

abstract class _Concept implements Concept {
  factory _Concept(
      {required int id,
      required String profile,
      required IdNamePair shop,
      required bool like}) = _$_Concept;

  factory _Concept.fromJson(Map<String, dynamic> json) = _$_Concept.fromJson;

  @override
  int get id;
  @override
  String get profile;
  @override
  IdNamePair get shop;
  @override
  bool get like;
  @override
  @JsonKey(ignore: true)
  _$ConceptCopyWith<_Concept> get copyWith =>
      throw _privateConstructorUsedError;
}

IdNamePair _$IdNamePairFromJson(Map<String, dynamic> json) {
  return _IdNamePair.fromJson(json);
}

/// @nodoc
class _$IdNamePairTearOff {
  const _$IdNamePairTearOff();

  _IdNamePair call({required int id, required String name}) {
    return _IdNamePair(
      id: id,
      name: name,
    );
  }

  IdNamePair fromJson(Map<String, Object?> json) {
    return IdNamePair.fromJson(json);
  }
}

/// @nodoc
const $IdNamePair = _$IdNamePairTearOff();

/// @nodoc
mixin _$IdNamePair {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdNamePairCopyWith<IdNamePair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdNamePairCopyWith<$Res> {
  factory $IdNamePairCopyWith(
          IdNamePair value, $Res Function(IdNamePair) then) =
      _$IdNamePairCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$IdNamePairCopyWithImpl<$Res> implements $IdNamePairCopyWith<$Res> {
  _$IdNamePairCopyWithImpl(this._value, this._then);

  final IdNamePair _value;
  // ignore: unused_field
  final $Res Function(IdNamePair) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$IdNamePairCopyWith<$Res> implements $IdNamePairCopyWith<$Res> {
  factory _$IdNamePairCopyWith(
          _IdNamePair value, $Res Function(_IdNamePair) then) =
      __$IdNamePairCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$IdNamePairCopyWithImpl<$Res> extends _$IdNamePairCopyWithImpl<$Res>
    implements _$IdNamePairCopyWith<$Res> {
  __$IdNamePairCopyWithImpl(
      _IdNamePair _value, $Res Function(_IdNamePair) _then)
      : super(_value, (v) => _then(v as _IdNamePair));

  @override
  _IdNamePair get _value => super._value as _IdNamePair;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_IdNamePair(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IdNamePair implements _IdNamePair {
  _$_IdNamePair({required this.id, required this.name});

  factory _$_IdNamePair.fromJson(Map<String, dynamic> json) =>
      _$$_IdNamePairFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'IdNamePair(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IdNamePair &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  _$IdNamePairCopyWith<_IdNamePair> get copyWith =>
      __$IdNamePairCopyWithImpl<_IdNamePair>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdNamePairToJson(this);
  }
}

abstract class _IdNamePair implements IdNamePair {
  factory _IdNamePair({required int id, required String name}) = _$_IdNamePair;

  factory _IdNamePair.fromJson(Map<String, dynamic> json) =
      _$_IdNamePair.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$IdNamePairCopyWith<_IdNamePair> get copyWith =>
      throw _privateConstructorUsedError;
}
