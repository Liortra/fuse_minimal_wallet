import 'package:fuse_minimal_wallet/data/model/transfer/transfer.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/transfer_data_source.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';

class TransferLocalRepository extends BaseUserAddressDataSource implements TransferDataSourceLocal {
  List<Transfer> _transfersCache = [];

  @override
  Future<List<Transfer>> loadTransfers() async {
    return _transfersCache;
  }

  @override
  Future<void> saveTransfers(List<Transfer> transfers) async {
    _transfersCache = transfers;
  }
}
