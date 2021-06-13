import 'package:fuse_minimal_wallet/data/source/balance/balance_data_source.dart';
import 'package:fuse_minimal_wallet/utils/utils.dart';

class BalanceRepository {
  final BalanceDataSourceLocal _local;
  final BalanceDataSourceRemote _remote;

  BalanceRepository(this._local, this._remote);

  Future<String?> getBalance(){
    return _local.loadBalance()
        .then((balance) async {
          if(balance != null) return balance;
          else return _local.loadUserAddress()
              .then((addressHash) => _remote.getBalance(addressHash))
              .then((balance) => _local.saveBalance(balance))
              .then((_) => _local.loadBalance());
    });
  }

  Future<void> logout(){
    return _local.deleteUserAddress();
  }
}
