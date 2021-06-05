import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/pages/home/main/main_bloc.dart';
import 'package:fuse_minimal_wallet/pages/home/main/main_states.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/balance/balance_page.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/transfer/transfer_page.dart';
import 'package:fuse_minimal_wallet/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _bloc = GetIt.I<MainBloc>();

  final Map<Tab, Widget> _tabsMap = {
    Tab(child: Text('Balance')): BalancePage(),
    Tab(child: Text('Transfer')): TransferPage(),
  };

  @override
  void initState() {
    super.initState();
    _bloc.start();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _mainSection();
  }

 Widget _mainSection() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: _headerBalance(),
          bottom: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: Colors.white),
            tabs: _tabsMap.keys.toList(),
          ),
        ),
        body: TabBarView(children: _tabsMap.values.toList()),
      ),
    );
 }

 Widget _headerBalance(){
   return BlocBuilder<MainBloc,BaseMainState>(
       bloc: _bloc,
       builder: (context,state) {
         switch(state.runtimeType){
           case ResultState:
             final balance = (state as ResultState).balance;
             return Text('Fuse Minimal Wallet\n Your Balance: $balance',
               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
               textAlign: TextAlign.center,);
           case ErrorMainState:
             final error = (state as ErrorMainState).message;
             return Text('$error',
               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
               textAlign: TextAlign.center,);
         }
         final error = "This area is undergoing maintenance";
         return Text('$error',
           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
           textAlign: TextAlign.center,);
       });
    }
}
