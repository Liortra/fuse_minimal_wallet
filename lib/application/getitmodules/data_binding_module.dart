import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fuse_minimal_wallet/data/securestorage/wallet_secure_storage.dart';
import 'package:get_it/get_it.dart';

class DataBindingModule {

  static providesModules(){
      _providesSecureStorage();
  }

  static _providesSecureStorage(){
    GetIt.I.registerLazySingleton((){
      final storage = FlutterSecureStorage();
      return WalletSecureStorage(storage);
    });
  }
}