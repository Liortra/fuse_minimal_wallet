import 'package:fuse_minimal_wallet/pages/home/main/main_bloc.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/balance/balance_bloc.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/transfer/transfer_bloc.dart';
import 'package:fuse_minimal_wallet/pages/login/login_bloc.dart';
import 'package:fuse_minimal_wallet/pages/splash/splash_bloc.dart';
import 'package:fuse_minimal_wallet/widgets/addtokenbottomsheet/add_token_bloc.dart';
import 'package:get_it/get_it.dart';

class BlocBindingModule {
  static provideBlocsModule() {
    GetIt.I.registerFactory(() => SplashBloc(GetIt.I.get()));
    GetIt.I.registerFactory(() => LoginBloc(GetIt.I.get(),GetIt.I.get()));
    GetIt.I.registerFactory(() => MainBloc(GetIt.I.get()));
    GetIt.I.registerFactory(() => TransferBloc(GetIt.I.get()));
    GetIt.I.registerFactory(() => BalanceBloc(GetIt.I.get(),GetIt.I.get()));
    GetIt.I.registerFactory(() => AddTokenBloc(GetIt.I.get()));
  }
}
