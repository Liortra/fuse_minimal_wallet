// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BalanceApi implements BalanceApi {
  _BalanceApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://explorer.fuse.io/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BalanceJSONResponse> getBalance(addressHash) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BalanceJSONResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '?module=account&action=balance&address=$addressHash',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BalanceJSONResponse.fromJson(_result.data!);
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
