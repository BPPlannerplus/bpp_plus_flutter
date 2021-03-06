// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ReviewClient implements ReviewClient {
  _ReviewClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://bpplaner.shop';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ReviewList> getReviews(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ReviewList>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reviews/shops/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReviewList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ReviewDetail> updateReview(id, reviewContent) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(reviewContent.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ReviewDetail>(
            Options(method: 'PATCH', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reviews/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReviewDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> reportReview(id, complain) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(complain.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/reviews/$id/complains/',
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
