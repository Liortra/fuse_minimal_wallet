import 'package:flutter/material.dart';
import 'package:fuse_minimal_wallet/application/getitmodules/bloc_binding_module.dart';
import 'package:fuse_minimal_wallet/application/getitmodules/data_binding_module.dart';
import 'package:fuse_minimal_wallet/application/getitmodules/net_binding_module.dart';
import 'package:fuse_minimal_wallet/application/getitmodules/repository_bind_module.dart';
import 'package:fuse_minimal_wallet/pages/login/login_page.dart';
import 'package:fuse_minimal_wallet/pages/splash/splash_page.dart';
import 'package:fuse_minimal_wallet/utils/utils.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  DataBindingModule.providesModules();
  NetBindingModule.provideNetModules();
  RepositoryBindingModule.provideRepositories();
  BlocBindingModule.provideBlocsModule();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(FutureBuilder(
    future: GetIt.I.allReady(),
    builder: (context, snapshot) {
      print("${snapshot.connectionState}");
      if(snapshot.connectionState == ConnectionState.done) return MyApp();
      else return LoadingConfigPage();
      // return MyApp();
    }
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fuse wallet',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.kPrimaryColor,
        scaffoldBackgroundColor: AppColor.kBackgroundColor,
        textTheme: TextTheme(
          headline4: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            color: AppColor.kPrimaryColor,
          ),
        ),
      ),
      home: SplashPage(),
    );
  }
}

class LoadingConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
