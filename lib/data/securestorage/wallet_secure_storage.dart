import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WalletSecureStorage {
  final FlutterSecureStorage _storage;

  WalletSecureStorage(this._storage);

  static const ADDRESS_KEY = "ADDRESS_KEY";


  Future<String?> getAddressHash()=>_storage.read(key: ADDRESS_KEY);
  Future<void> setAddressHash(String? value)=>_storage.write(key: ADDRESS_KEY, value: value);
  Future<void> deleteAddressHash()=>_storage.delete(key: ADDRESS_KEY);


}