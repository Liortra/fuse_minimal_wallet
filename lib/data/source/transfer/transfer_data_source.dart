import 'package:fuse_minimal_wallet/data/model/transfer/transfer.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';

abstract class TransferDataSourceLocal extends BaseUserAddressDataSource {
  Future<void> saveTransfers(List<Transfer> transfers);

  Future<List<Transfer>> loadTransfers();
}

abstract class TransferDataSourceRemote {
  Future<List<Transfer>> getTransfers(String addressHash);
}
