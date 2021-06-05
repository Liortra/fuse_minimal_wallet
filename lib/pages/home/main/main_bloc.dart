import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/model/fusehttperror/fuse_http_error.dart';
import 'package:fuse_minimal_wallet/data/source/balance/balance_repository.dart';
import 'package:fuse_minimal_wallet/pages/home/main/main_states.dart';

class MainBloc extends Cubit<BaseMainState>{

  final BalanceRepository _balanceRepository;

  MainBloc(this._balanceRepository) : super(LoadingMainState());
  
  start() async{
   try {
    final balance = await _balanceRepository.getBalance();
     emit(ResultState(balance!));
   } on FuseHttpError catch (e) {
     emit(ErrorMainState(e.message, error: e));
   } catch(e,stackTrace){
     var message = "Catch: Something wrong, check again $e";
     print("show error: $e stack: $stackTrace");
     emit(ErrorMainState(message, error: e));
   }
  }
}