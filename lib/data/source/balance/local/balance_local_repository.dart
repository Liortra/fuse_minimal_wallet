import 'package:fuse_minimal_wallet/data/source/balance/balance_data_source.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';

class BalanceLocalRepository extends BaseUserAddressDataSource implements BalanceDataSourceLocal {
  String? _balanceCache;

  @override
  Future<String?> loadBalance() async {
    return _balanceCache;
  }

  @override
  Future<void> saveBalance(String? balance) async {
    _balanceCache = balance;
  }
}
