// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ReservationClient implements ReservationClient {
  _ReservationClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://bpplaner.shop';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MypageResponse> getShopReservations(inquiry) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'inquiry': inquiry};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MypageResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reservations/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MypageResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ReservationResponse> setShopReservation(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ReservationResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reservations/shops/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReservationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> setShopReservationDate(id, date) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(date.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'PATCH', headers: _headers, extra: _extra)
            .compose(_dio.options, '/reservations/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> deleteShopReservation(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/reservations/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> deleteReservationByShopType(shopType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'shop_type': shopType};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/reservations/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<ReviewDetail> getReview(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ReviewDetail>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reservations/$id/reviews',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReviewDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> createReview(id, reviewRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(reviewRequest.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/reservations/$id/reviews/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
