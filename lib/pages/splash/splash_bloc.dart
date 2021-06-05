import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';
import 'package:fuse_minimal_wallet/pages/splash/splash_states.dart';

class SplashBloc extends Cubit<BaseSplashState>{
  final UserLocalDataSource _userLocalDataSource;

  SplashBloc(this._userLocalDataSource) : super(LoadingState());

  start() async {
    try {
      final exists = await _userLocalDataSource.checkUserAddressExist();
      await Future.delayed(Duration(milliseconds: 500));
      emit(exists ? NavigateMainPageState() : NavigateLoginPageState());
    } catch(e,stackTrace){
      // var message = "Catch: Something wrong, check again $e";
      print("show error: $e stack: $stackTrace");
      // emit(ErrorSplashState(message, error: e));
      emit(NavigateLoginPageState());
    }
  }
}