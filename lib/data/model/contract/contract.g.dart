// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contract _$ContractFromJson(Map<String, dynamic> json) {
  return Contract(
    json['cataloged'] as bool?,
    json['contractAddress'] as String?,
    json['decimals'] as String?,
    json['name'] as String?,
    json['symbol'] as String?,
    json['totalSupply'] as String?,
    json['type'] as String?,
  );
}

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'cataloged': instance.cataloged,
      'contractAddress': instance.contractAddress,
      'decimals': instance.decimals,
      'name': instance.name,
      'symbol': instance.symbol,
      'totalSupply': instance.totalSupply,
      'type': instance.type,
    };
