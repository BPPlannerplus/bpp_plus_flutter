import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_response.g.dart';
part 'reservation_response.freezed.dart';

@freezed
class ReservationResponse with _$ReservationResponse {
  factory ReservationResponse({
    @JsonKey(name: 'reservation id') required int reservationId,
  }) = _ReservationReseponse;

  factory ReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationResponseFromJson(json);
}
