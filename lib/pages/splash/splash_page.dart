import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuse_minimal_wallet/pages/home/main/main_page.dart';
import 'package:fuse_minimal_wallet/pages/login/login_page.dart';
import 'package:fuse_minimal_wallet/pages/splash/splash_bloc.dart';
import 'package:fuse_minimal_wallet/pages/splash/splash_states.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {

  final _bloc = GetIt.I<SplashBloc>();
  StreamSubscription? _streamSubscription;
  late AnimationController _animController;

  @override
  void initState() {
    _animController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    final curve = CurvedAnimation(parent: _animController, curve: Curves.decelerate);
    final _animScale = Tween<Offset>(begin: Offset(0.0, 0.90), end: Offset.zero).animate(curve);
    super.initState();

    _streamSubscription = _bloc
        .stream
        .where((state) => state is NavigateMainPageState || state is NavigateLoginPageState)
        .listen((state) {
        final child = state is NavigateMainPageState ? MainPage() : LoginPage();
        Navigator.pushReplacement(context, PageRouteBuilder(
            pageBuilder: (_,anim,__)=> FadeTransition(opacity: anim,
        child: child)));
    });

    _animController.forward();

    _bloc.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FadeTransition(
            opacity: _animController,
            child: ScaleTransition(
              scale: _animController,
              child: Image.asset("assets/images/icon.png",),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription?.cancel();
  }
}
