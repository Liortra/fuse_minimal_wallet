import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/model/fusehttperror/fuse_http_error.dart';
import 'package:fuse_minimal_wallet/data/source/balance/balance_repository.dart';
import 'package:fuse_minimal_wallet/pages/home/main/main_states.dart';
import 'package:fuse_minimal_wallet/utils/utils.dart';

class MainBloc extends Cubit<BaseMainState>{

  final BalanceRepository _balanceRepository;

  MainBloc(this._balanceRepository) : super(LoadingMainState());
  
  start() async{
   try {
    final balance = await _balanceRepository.getBalance();
     emit(ResultState(checkBalance(balance!)));
   } on FuseHttpError catch (e) {
     emit(ErrorMainState(e.message, error: e));
   } catch(e,stackTrace){
     var message = "Catch: Something wrong, check again $e";
     print("show error: $e stack: $stackTrace");
     emit(ErrorMainState(message, error: e));
   }
  }
  
  logout() async {
    try{
      _balanceRepository.logout();
      emit(LogoutState());
    } catch(e,stackTrace){
      var message = "Catch: Something wrong, check again $e";
      print("show error: $e stack: $stackTrace");
      emit(ErrorMainState(message, error: e));
    }
  }

  String checkBalance(String value) {
    var length =  value.length - Const.DECIMAL;
    var balance = value;
    if(length <= 0) {
      var size = length.abs() + 1;
      for (var i = 0; i < size; i++) {
        balance = "0" + balance;
        length++;
      }
    }
    return value.substring(length).length > Const.REMAINDER ?
    StringUtils.addCharAtPosition(balance.substring(0,length + Const.REMAINDER), ".", length) :
    StringUtils.addCharAtPosition(balance, ".", length);
  }
}