// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TokenApi implements TokenApi {
  _TokenApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://explorer.fuse.io/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TokenJSONResponse> getTokens(addressHash) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TokenJSONResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '?module=account&action=tokenlist&address=$addressHash',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TokenJSONResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ContractJSONResponse> addToken(contractAddressHash) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        ContractJSONResponse>(Options(
            method: 'GET', headers: <String, dynamic>{}, extra: _extra)
        .compose(_dio.options,
            '?module=token&action=getToken&contractaddress=$contractAddressHash',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ContractJSONResponse.fromJson(_result.data!);
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
