import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable()
class LikeRequest {
  @JsonKey(name: 'change_to_like')
  bool like;

  LikeRequest({
    required this.like,
  });

  factory LikeRequest.fromJson(Map<String, dynamic> json) =>
      _$LikeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LikeRequestToJson(this);
}

@JsonSerializable()
class LikeResponse {
  String results;

  LikeResponse({
    required this.results,
  });

  factory LikeResponse.fromJson(Map<String, dynamic> json) =>
      _$LikeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LikeResponseToJson(this);
}
