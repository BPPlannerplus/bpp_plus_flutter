// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ShopClient implements ShopClient {
  _ShopClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://ec2-54-180-83-124.ap-northeast-2.compute.amazonaws.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ShopList> getStudioList(page, like, address) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'like': like,
      r'address': address
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShopList>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/shops/studios/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShopList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShopList> getBeautyList(page, like, address) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'like': like,
      r'address': address
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShopList>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/shops/beautyshops/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShopList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShopList> getWaxingList(page, like, address) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'like': like,
      r'address': address
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShopList>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/shops/waxingshops/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShopList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShopList> getTanningList(page, like, address) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'like': like,
      r'address': address
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShopList>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/shops/tanningshops/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShopList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShopDetailData> getShopData(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShopDetailData>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/shops/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShopDetailData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ShopConcepts> getShopConcepts(id, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ShopConcepts>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/shops/$id/concepts',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ShopConcepts.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> setLike(id, like) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(like.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'PUT', headers: _headers, extra: _extra)
            .compose(_dio.options, '/shops/$id/like',
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
