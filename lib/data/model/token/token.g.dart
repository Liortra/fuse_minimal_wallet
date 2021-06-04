// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token(
    json['balance'] as String?,
    json['contractAddress'] as String?,
    json['decimals'] as String?,
    json['symbol'] as String?,
    json['type'] as String?,
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'balance': instance.balance,
      'contractAddress': instance.contractAddress,
      'decimals': instance.decimals,
      'symbol': instance.symbol,
      'type': instance.type,
    };
