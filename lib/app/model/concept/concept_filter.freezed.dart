// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'concept_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConceptFilterTearOff {
  const _$ConceptFilterTearOff();

  _ConceptFilter call(
      {required List<String> headNum,
      required List<String> gender,
      required List<String> background,
      required List<String> prop,
      required List<String> cloth}) {
    return _ConceptFilter(
      headNum: headNum,
      gender: gender,
      background: background,
      prop: prop,
      cloth: cloth,
    );
  }
}

/// @nodoc
const $ConceptFilter = _$ConceptFilterTearOff();

/// @nodoc
mixin _$ConceptFilter {
  List<String> get headNum => throw _privateConstructorUsedError;
  List<String> get gender => throw _privateConstructorUsedError;
  List<String> get background => throw _privateConstructorUsedError;
  List<String> get prop => throw _privateConstructorUsedError;
  List<String> get cloth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConceptFilterCopyWith<ConceptFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptFilterCopyWith<$Res> {
  factory $ConceptFilterCopyWith(
          ConceptFilter value, $Res Function(ConceptFilter) then) =
      _$ConceptFilterCopyWithImpl<$Res>;
  $Res call(
      {List<String> headNum,
      List<String> gender,
      List<String> background,
      List<String> prop,
      List<String> cloth});
}

/// @nodoc
class _$ConceptFilterCopyWithImpl<$Res>
    implements $ConceptFilterCopyWith<$Res> {
  _$ConceptFilterCopyWithImpl(this._value, this._then);

  final ConceptFilter _value;
  // ignore: unused_field
  final $Res Function(ConceptFilter) _then;

  @override
  $Res call({
    Object? headNum = freezed,
    Object? gender = freezed,
    Object? background = freezed,
    Object? prop = freezed,
    Object? cloth = freezed,
  }) {
    return _then(_value.copyWith(
      headNum: headNum == freezed
          ? _value.headNum
          : headNum // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<String>,
      background: background == freezed
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prop: prop == freezed
          ? _value.prop
          : prop // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cloth: cloth == freezed
          ? _value.cloth
          : cloth // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ConceptFilterCopyWith<$Res>
    implements $ConceptFilterCopyWith<$Res> {
  factory _$ConceptFilterCopyWith(
          _ConceptFilter value, $Res Function(_ConceptFilter) then) =
      __$ConceptFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String> headNum,
      List<String> gender,
      List<String> background,
      List<String> prop,
      List<String> cloth});
}

/// @nodoc
class __$ConceptFilterCopyWithImpl<$Res>
    extends _$ConceptFilterCopyWithImpl<$Res>
    implements _$ConceptFilterCopyWith<$Res> {
  __$ConceptFilterCopyWithImpl(
      _ConceptFilter _value, $Res Function(_ConceptFilter) _then)
      : super(_value, (v) => _then(v as _ConceptFilter));

  @override
  _ConceptFilter get _value => super._value as _ConceptFilter;

  @override
  $Res call({
    Object? headNum = freezed,
    Object? gender = freezed,
    Object? background = freezed,
    Object? prop = freezed,
    Object? cloth = freezed,
  }) {
    return _then(_ConceptFilter(
      headNum: headNum == freezed
          ? _value.headNum
          : headNum // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<String>,
      background: background == freezed
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prop: prop == freezed
          ? _value.prop
          : prop // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cloth: cloth == freezed
          ? _value.cloth
          : cloth // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_ConceptFilter implements _ConceptFilter {
  _$_ConceptFilter(
      {required this.headNum,
      required this.gender,
      required this.background,
      required this.prop,
      required this.cloth});

  @override
  final List<String> headNum;
  @override
  final List<String> gender;
  @override
  final List<String> background;
  @override
  final List<String> prop;
  @override
  final List<String> cloth;

  @override
  String toString() {
    return 'ConceptFilter(headNum: $headNum, gender: $gender, background: $background, prop: $prop, cloth: $cloth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConceptFilter &&
            const DeepCollectionEquality().equals(other.headNum, headNum) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.background, background) &&
            const DeepCollectionEquality().equals(other.prop, prop) &&
            const DeepCollectionEquality().equals(other.cloth, cloth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(headNum),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(prop),
      const DeepCollectionEquality().hash(cloth));

  @JsonKey(ignore: true)
  @override
  _$ConceptFilterCopyWith<_ConceptFilter> get copyWith =>
      __$ConceptFilterCopyWithImpl<_ConceptFilter>(this, _$identity);
}

abstract class _ConceptFilter implements ConceptFilter {
  factory _ConceptFilter(
      {required List<String> headNum,
      required List<String> gender,
      required List<String> background,
      required List<String> prop,
      required List<String> cloth}) = _$_ConceptFilter;

  @override
  List<String> get headNum;
  @override
  List<String> get gender;
  @override
  List<String> get background;
  @override
  List<String> get prop;
  @override
  List<String> get cloth;
  @override
  @JsonKey(ignore: true)
  _$ConceptFilterCopyWith<_ConceptFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
