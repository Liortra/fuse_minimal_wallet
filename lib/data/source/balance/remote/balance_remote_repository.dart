import 'package:fuse_minimal_wallet/data/source/balance/api/balance_api.dart';
import 'package:fuse_minimal_wallet/data/source/balance/balance_data_source.dart';

class BalanceRemoteRepository implements BalanceDataSourceRemote {
  final BalanceApi _balanceApi;

  BalanceRemoteRepository(this._balanceApi);

  @override
  Future<String?> getBalance(String addressHash) {
    return _balanceApi.getBalance(addressHash).then((response) => response.result);
  }
}
