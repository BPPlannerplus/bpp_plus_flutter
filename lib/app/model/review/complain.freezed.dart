// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'complain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Complain _$ComplainFromJson(Map<String, dynamic> json) {
  return _Complain.fromJson(json);
}

/// @nodoc
class _$ComplainTearOff {
  const _$ComplainTearOff();

  _Complain call({required String reason, String? contents}) {
    return _Complain(
      reason: reason,
      contents: contents,
    );
  }

  Complain fromJson(Map<String, Object?> json) {
    return Complain.fromJson(json);
  }
}

/// @nodoc
const $Complain = _$ComplainTearOff();

/// @nodoc
mixin _$Complain {
  String get reason => throw _privateConstructorUsedError;
  String? get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplainCopyWith<Complain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplainCopyWith<$Res> {
  factory $ComplainCopyWith(Complain value, $Res Function(Complain) then) =
      _$ComplainCopyWithImpl<$Res>;
  $Res call({String reason, String? contents});
}

/// @nodoc
class _$ComplainCopyWithImpl<$Res> implements $ComplainCopyWith<$Res> {
  _$ComplainCopyWithImpl(this._value, this._then);

  final Complain _value;
  // ignore: unused_field
  final $Res Function(Complain) _then;

  @override
  $Res call({
    Object? reason = freezed,
    Object? contents = freezed,
  }) {
    return _then(_value.copyWith(
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ComplainCopyWith<$Res> implements $ComplainCopyWith<$Res> {
  factory _$ComplainCopyWith(_Complain value, $Res Function(_Complain) then) =
      __$ComplainCopyWithImpl<$Res>;
  @override
  $Res call({String reason, String? contents});
}

/// @nodoc
class __$ComplainCopyWithImpl<$Res> extends _$ComplainCopyWithImpl<$Res>
    implements _$ComplainCopyWith<$Res> {
  __$ComplainCopyWithImpl(_Complain _value, $Res Function(_Complain) _then)
      : super(_value, (v) => _then(v as _Complain));

  @override
  _Complain get _value => super._value as _Complain;

  @override
  $Res call({
    Object? reason = freezed,
    Object? contents = freezed,
  }) {
    return _then(_Complain(
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Complain implements _Complain {
  _$_Complain({required this.reason, this.contents});

  factory _$_Complain.fromJson(Map<String, dynamic> json) =>
      _$$_ComplainFromJson(json);

  @override
  final String reason;
  @override
  final String? contents;

  @override
  String toString() {
    return 'Complain(reason: $reason, contents: $contents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Complain &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason, contents);

  @JsonKey(ignore: true)
  @override
  _$ComplainCopyWith<_Complain> get copyWith =>
      __$ComplainCopyWithImpl<_Complain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComplainToJson(this);
  }
}

abstract class _Complain implements Complain {
  factory _Complain({required String reason, String? contents}) = _$_Complain;

  factory _Complain.fromJson(Map<String, dynamic> json) = _$_Complain.fromJson;

  @override
  String get reason;
  @override
  String? get contents;
  @override
  @JsonKey(ignore: true)
  _$ComplainCopyWith<_Complain> get copyWith =>
      throw _privateConstructorUsedError;
}
