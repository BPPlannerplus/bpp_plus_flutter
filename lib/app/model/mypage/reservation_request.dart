import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_request.g.dart';
part 'reservation_request.freezed.dart';

@freezed
class ReservationRequest with _$ReservationRequest {
  factory ReservationRequest({
    @JsonKey(name: 'reserved_date') required String date,
  }) = _ReservationRequest;

  factory ReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$ReservationRequestFromJson(json);
}
