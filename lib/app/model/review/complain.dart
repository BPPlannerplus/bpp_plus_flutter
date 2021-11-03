import 'package:freezed_annotation/freezed_annotation.dart';

part 'complain.freezed.dart';
part 'complain.g.dart';

@freezed
class Complain with _$Complain {
  factory Complain({
    required String reason,
    required String contents,
  }) = _Complain;

  factory Complain.fromJson(Map<String, dynamic> json) =>
      _$ComplainFromJson(json);
}
