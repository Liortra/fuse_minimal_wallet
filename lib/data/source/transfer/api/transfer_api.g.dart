// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TransferApi implements TransferApi {
  _TransferApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://explorer.fuse.io/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TransferJSONResponse> getTransfers(addressHash) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TransferJSONResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '?module=account&action=tokentx&address=$addressHash',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TransferJSONResponse.fromJson(_result.data!);
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
