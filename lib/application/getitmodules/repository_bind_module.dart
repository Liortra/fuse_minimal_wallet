 import 'package:fuse_minimal_wallet/data/securestorage/wallet_secure_storage.dart';
import 'package:fuse_minimal_wallet/data/source/balance/balance_data_source.dart';
import 'package:fuse_minimal_wallet/data/source/balance/balance_repository.dart';
import 'package:fuse_minimal_wallet/data/source/balance/local/balance_local_repository.dart';
import 'package:fuse_minimal_wallet/data/source/balance/remote/balance_remote_repository.dart';
import 'package:fuse_minimal_wallet/data/source/token/local/token_local_repository.dart';
import 'package:fuse_minimal_wallet/data/source/token/remote/token_remote_repository.dart';
import 'package:fuse_minimal_wallet/data/source/token/token_data_source.dart';
import 'package:fuse_minimal_wallet/data/source/token/token_repository.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/local/transfer_local_repository.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/remote/transfer_remote_repository.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/transfer_data_source.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/transfer_repository.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_local_respository.dart';
import 'package:get_it/get_it.dart';

class RepositoryBindingModule {
  static provideRepositories() {
    _providesUserLocalRepository();
    _provideBalanceRepositoryModule();
    _provideTokenRepositoryModule();
    _provideTransferRepositoryModule();
  }

  static void _providesUserLocalRepository() {
    GetIt.I.registerLazySingleton<UserLocalDataSource>(() => UserLocalRepository(GetIt.I()));
  }


  static void _provideBalanceRepositoryModule() {
    GetIt.I.registerFactory<BalanceDataSourceRemote>(() => BalanceRemoteRepository(GetIt.I()));
    GetIt.I.registerLazySingleton<BalanceDataSourceLocal>(() => BalanceLocalRepository());
    GetIt.I.registerFactory<BalanceRepository>(() => BalanceRepository(GetIt.I.get(), GetIt.I.get()));
  }

  static void _provideTokenRepositoryModule() {
    GetIt.I.registerFactory<TokenDataSourceRemote>(() => TokenRemoteRepository(GetIt.I.get()));
    GetIt.I.registerLazySingleton<TokenDataSourceLocal>(() => TokenLocalRepository());
    GetIt.I.registerFactory<TokenRepository>(() => TokenRepository(GetIt.I.get(), GetIt.I.get()));
  }

  static void _provideTransferRepositoryModule() {
    GetIt.I.registerFactory<TransferDataSourceRemote>(() => TransferRemoteRepository(GetIt.I.get()));
    GetIt.I.registerLazySingleton<TransferDataSourceLocal>(() => TransferLocalRepository());
    GetIt.I.registerFactory<TransferRepository>(() => TransferRepository(GetIt.I.get(), GetIt.I.get()));
  }
}
