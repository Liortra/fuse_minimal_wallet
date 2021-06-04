import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/model/fusehttperror/fuse_http_error.dart';
import 'package:fuse_minimal_wallet/data/source/balance/balance_repository.dart';
import 'package:fuse_minimal_wallet/pages/home/main/main_states.dart';

class MainBloc extends Cubit<BaseMainState>{

  final BalanceRepository _balanceRepository;

  MainBloc(this._balanceRepository) : super(LoadingMainState());
  
  start() async{
   try {
    // final balance = await _balanceRepository.getBalance(addressHash)
   } on FuseHttpError catch(e){
     var message = "";
     switch (e.status) {
       case "0":
         print("SUCCESS GET HttpError");
         final error = e.message as FuseHttpError;
         message = error.message;
         break;
       default:
         print("FAILED GET HttpError");
         message = "Something wrong, check again";
         break;
     }
     emit(ErrorMainState(message, error: e));
   } catch(e){
     var message = "Catch: Something wrong, check again";
     emit(ErrorMainState(message, error: e));
   }
  }
}