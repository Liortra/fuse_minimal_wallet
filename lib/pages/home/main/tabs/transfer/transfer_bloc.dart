import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/model/fusehttperror/fuse_http_error.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/transfer_repository.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/transfer/transfer_states.dart';

class TransferBloc extends Cubit<BaseTransferState> {
  final TransferRepository _transferRepository;

  TransferBloc(this._transferRepository) : super(LoadingTransferState());

  getTransfers() async {
    try {
      final result = await _transferRepository.getTransfers();
      emit(ResultState(result!));
    } on FuseHttpError catch (e) {
      emit(ErrorTransferState(e.message, error: e));
    } catch(e,stackTrace){
      var message = "Catch: Something wrong, check again $e";
      print("show error: $e stack: $stackTrace");
      emit(ErrorTransferState(message, error: e));
    }
  }
}
