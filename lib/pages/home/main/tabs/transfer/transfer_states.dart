import 'package:fuse_minimal_wallet/data/model/transfer/transfer.dart';

abstract class BaseTransferState {}

class LoadingTransferState extends BaseTransferState {}

class ResultState extends BaseTransferState {
  final List<Transfer> transfers;

  ResultState(this.transfers);
}

class ErrorTransferState extends BaseTransferState {
  final String message;
  final dynamic error;

  ErrorTransferState(this.message, {this.error});
}
