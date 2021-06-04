import 'package:fuse_minimal_wallet/data/model/transfer/transfer.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/transfer_data_source.dart';
import 'package:fuse_minimal_wallet/utils/utils.dart';

class TransferRepository {
  final TransferDataSourceLocal _local;
  final TransferDataSourceRemote _remote;

  TransferRepository(this._local, this._remote);

  Future<List<Transfer>?> getTransfers(){
    return _local.loadTransfers()
        .then((transfers) {
          if(transfers.isNotEmpty) return transfers;
          else return _local.loadUserAddress()
            .then((addressHash) => _remote.getTransfers(addressHash))
            .then((transfers) => _local.saveTransfers(transfers))
            .then((_) => _local.loadTransfers());
    });
  }
}
