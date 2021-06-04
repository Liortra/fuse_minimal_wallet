import 'package:fuse_minimal_wallet/data/model/transfer/transfer.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/api/transfer_api.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/transfer_data_source.dart';

class TransferRemoteRepository implements TransferDataSourceRemote {
  final TransferApi _transferApi;

  TransferRemoteRepository(this._transferApi);

  @override
  Future<List<Transfer>> getTransfers(String addressHash) {
    return _transferApi.getTransfers(addressHash).then((response) => response.result??[]);
  }
}
