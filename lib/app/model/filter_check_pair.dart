import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_check_pair.freezed.dart';

@freezed
class FilterCheckPair with _$FilterCheckPair {
  factory FilterCheckPair({
    required String id,
    required String value,
    @Default(false) bool check,
  }) = _FilterCheckPair;
}
