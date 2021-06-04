import 'package:flutter/material.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/balance/balance_page.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/transfer/transfer_page.dart';
import 'package:fuse_minimal_wallet/widgets/widgets.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final Map<Tab, Widget> _tabsMap = {
    Tab(child: Text('Balance')): BalancePage(),
    Tab(child: Text('Transfer')): TransferPage(),
  };

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
          title: Text('Fuse Minimal Wallet'),
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
    return Text("Balance");
 }
}
