import 'package:fuse_minimal_wallet/data/securestorage/wallet_secure_storage.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';

class UserLocalRepository implements UserLocalDataSource {

  final WalletSecureStorage _storage;

  UserLocalRepository(this._storage);

  @override
  Future<bool> checkUserAddressExist() {
    return loadUserAddress()
        .then((value) => value!= null && value.isNotEmpty);
  }

  @override
  Future<String?> loadUserAddress() {
    return _storage.getAddressHash();
  }

  @override
  Future<void> saveUserAddress(String userAddress) {
    return _storage.setAddressHash(userAddress);
  }

  @override
  Future<void> deleteUserAddress() {
    return _storage.deleteAddressHash();
  }

}