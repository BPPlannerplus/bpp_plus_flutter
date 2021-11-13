// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concept_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ConceptClient implements ConceptClient {
  _ConceptClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://ec2-54-180-83-124.ap-northeast-2.compute.amazonaws.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ConceptList> getStudioList(
      page, like, headCount, gender, background, prop, dress) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'like': like,
      r'head_count': headCount,
      r'gender': gender,
      r'background': background,
      r'prop': prop,
      r'dress': dress
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ConceptList>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/concept/studios/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConceptList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LikeResponse> setLike(id, like) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(like.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LikeResponse>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, '/concept/studios/$id/like',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LikeResponse.fromJson(_result.data!);
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
