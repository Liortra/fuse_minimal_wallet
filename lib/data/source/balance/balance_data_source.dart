import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';

abstract class BalanceDataSourceLocal extends BaseUserAddressDataSource{
  Future<void> saveBalance(String? balance);

  Future<String?> loadBalance();
}

abstract class BalanceDataSourceRemote {
  Future<String?> getBalance(String addressHash);
}
