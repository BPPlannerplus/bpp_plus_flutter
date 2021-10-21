// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_check_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FilterCheckPairTearOff {
  const _$FilterCheckPairTearOff();

  _FilterCheckPair call(
      {required String id, required String value, bool check = false}) {
    return _FilterCheckPair(
      id: id,
      value: value,
      check: check,
    );
  }
}

/// @nodoc
const $FilterCheckPair = _$FilterCheckPairTearOff();

/// @nodoc
mixin _$FilterCheckPair {
  String get id => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  bool get check => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterCheckPairCopyWith<FilterCheckPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCheckPairCopyWith<$Res> {
  factory $FilterCheckPairCopyWith(
          FilterCheckPair value, $Res Function(FilterCheckPair) then) =
      _$FilterCheckPairCopyWithImpl<$Res>;
  $Res call({String id, String value, bool check});
}

/// @nodoc
class _$FilterCheckPairCopyWithImpl<$Res>
    implements $FilterCheckPairCopyWith<$Res> {
  _$FilterCheckPairCopyWithImpl(this._value, this._then);

  final FilterCheckPair _value;
  // ignore: unused_field
  final $Res Function(FilterCheckPair) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? check = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      check: check == freezed
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FilterCheckPairCopyWith<$Res>
    implements $FilterCheckPairCopyWith<$Res> {
  factory _$FilterCheckPairCopyWith(
          _FilterCheckPair value, $Res Function(_FilterCheckPair) then) =
      __$FilterCheckPairCopyWithImpl<$Res>;
  @override
  $Res call({String id, String value, bool check});
}

/// @nodoc
class __$FilterCheckPairCopyWithImpl<$Res>
    extends _$FilterCheckPairCopyWithImpl<$Res>
    implements _$FilterCheckPairCopyWith<$Res> {
  __$FilterCheckPairCopyWithImpl(
      _FilterCheckPair _value, $Res Function(_FilterCheckPair) _then)
      : super(_value, (v) => _then(v as _FilterCheckPair));

  @override
  _FilterCheckPair get _value => super._value as _FilterCheckPair;

  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? check = freezed,
  }) {
    return _then(_FilterCheckPair(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      check: check == freezed
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FilterCheckPair implements _FilterCheckPair {
  _$_FilterCheckPair(
      {required this.id, required this.value, this.check = false});

  @override
  final String id;
  @override
  final String value;
  @JsonKey(defaultValue: false)
  @override
  final bool check;

  @override
  String toString() {
    return 'FilterCheckPair(id: $id, value: $value, check: $check)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterCheckPair &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.check, check) || other.check == check));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, value, check);

  @JsonKey(ignore: true)
  @override
  _$FilterCheckPairCopyWith<_FilterCheckPair> get copyWith =>
      __$FilterCheckPairCopyWithImpl<_FilterCheckPair>(this, _$identity);
}

abstract class _FilterCheckPair implements FilterCheckPair {
  factory _FilterCheckPair(
      {required String id,
      required String value,
      bool check}) = _$_FilterCheckPair;

  @override
  String get id;
  @override
  String get value;
  @override
  bool get check;
  @override
  @JsonKey(ignore: true)
  _$FilterCheckPairCopyWith<_FilterCheckPair> get copyWith =>
      throw _privateConstructorUsedError;
}
