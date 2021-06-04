import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/source/balance/balance_repository.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';
import 'package:fuse_minimal_wallet/pages/login/login_states.dart';
import 'package:fuse_minimal_wallet/data/model/fusehttperror/fuse_http_error.dart';

class LoginBloc extends Cubit<BaseLoginState> {
  final UserLocalDataSource _userLocalDataSource;
  final BalanceRepository _balanceRepository;
  String? _userAddress;
  LoginBloc(this._balanceRepository, this._userLocalDataSource) : super(DefaultLoginState(false));


  void validField(String text){
    _userAddress = text;
    emit(DefaultLoginState(text.isNotEmpty));
  }

  login() async{
    if(_userAddress == null || _userAddress!.isEmpty) {
      var message = "Something wrong, check again";
      var e = "Check Again";
      return emit(ErrorLoginState(message, error: e));
    }
    emit(LoadingLoginState());
    await _userLocalDataSource.saveUserAddress(_userAddress!);
    _loadData();
  }

  void _loadData() async {
    try {
      await _balanceRepository.getBalance();
      emit(FinishLoginState());
    } on FuseHttpError catch (e) {
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
      emit(ErrorLoginState(message, error: e));
    } catch(e,stackTrace){
      var message = "Catch: Something wrong, check again $e";
      print("show error: $e stack: $stackTrace");
      emit(ErrorLoginState(message, error: e));
    }
  }
}
