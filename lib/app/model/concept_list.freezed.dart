// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'concept_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConceptList _$ConceptListFromJson(Map<String, dynamic> json) {
  return _ConceptList.fromJson(json);
}

/// @nodoc
class _$ConceptListTearOff {
  const _$ConceptListTearOff();

  _ConceptList call({required List<Concept> concepts, String? next}) {
    return _ConceptList(
      concepts: concepts,
      next: next,
    );
  }

  ConceptList fromJson(Map<String, Object?> json) {
    return ConceptList.fromJson(json);
  }
}

/// @nodoc
const $ConceptList = _$ConceptListTearOff();

/// @nodoc
mixin _$ConceptList {
  List<Concept> get concepts => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConceptListCopyWith<ConceptList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptListCopyWith<$Res> {
  factory $ConceptListCopyWith(
          ConceptList value, $Res Function(ConceptList) then) =
      _$ConceptListCopyWithImpl<$Res>;
  $Res call({List<Concept> concepts, String? next});
}

/// @nodoc
class _$ConceptListCopyWithImpl<$Res> implements $ConceptListCopyWith<$Res> {
  _$ConceptListCopyWithImpl(this._value, this._then);

  final ConceptList _value;
  // ignore: unused_field
  final $Res Function(ConceptList) _then;

  @override
  $Res call({
    Object? concepts = freezed,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      concepts: concepts == freezed
          ? _value.concepts
          : concepts // ignore: cast_nullable_to_non_nullable
              as List<Concept>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ConceptListCopyWith<$Res>
    implements $ConceptListCopyWith<$Res> {
  factory _$ConceptListCopyWith(
          _ConceptList value, $Res Function(_ConceptList) then) =
      __$ConceptListCopyWithImpl<$Res>;
  @override
  $Res call({List<Concept> concepts, String? next});
}

/// @nodoc
class __$ConceptListCopyWithImpl<$Res> extends _$ConceptListCopyWithImpl<$Res>
    implements _$ConceptListCopyWith<$Res> {
  __$ConceptListCopyWithImpl(
      _ConceptList _value, $Res Function(_ConceptList) _then)
      : super(_value, (v) => _then(v as _ConceptList));

  @override
  _ConceptList get _value => super._value as _ConceptList;

  @override
  $Res call({
    Object? concepts = freezed,
    Object? next = freezed,
  }) {
    return _then(_ConceptList(
      concepts: concepts == freezed
          ? _value.concepts
          : concepts // ignore: cast_nullable_to_non_nullable
              as List<Concept>,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConceptList implements _ConceptList {
  _$_ConceptList({required this.concepts, this.next});

  factory _$_ConceptList.fromJson(Map<String, dynamic> json) =>
      _$$_ConceptListFromJson(json);

  @override
  final List<Concept> concepts;
  @override
  final String? next;

  @override
  String toString() {
    return 'ConceptList(concepts: $concepts, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConceptList &&
            const DeepCollectionEquality().equals(other.concepts, concepts) &&
            (identical(other.next, next) || other.next == next));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(concepts), next);

  @JsonKey(ignore: true)
  @override
  _$ConceptListCopyWith<_ConceptList> get copyWith =>
      __$ConceptListCopyWithImpl<_ConceptList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConceptListToJson(this);
  }
}

abstract class _ConceptList implements ConceptList {
  factory _ConceptList({required List<Concept> concepts, String? next}) =
      _$_ConceptList;

  factory _ConceptList.fromJson(Map<String, dynamic> json) =
      _$_ConceptList.fromJson;

  @override
  List<Concept> get concepts;
  @override
  String? get next;
  @override
  @JsonKey(ignore: true)
  _$ConceptListCopyWith<_ConceptList> get copyWith =>
      throw _privateConstructorUsedError;
}
