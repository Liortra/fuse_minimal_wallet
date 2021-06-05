import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/model/token/token.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/balance/balance_bloc.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/balance/balance_states.dart';
import 'package:fuse_minimal_wallet/utils/constants/app_color.dart';
import 'package:fuse_minimal_wallet/widgets/addtokenbottomsheet/add_toke_bottom_sheet.dart';
import 'package:fuse_minimal_wallet/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class BalancePage extends StatefulWidget {
  BalancePage({Key? key}) : super(key: key);

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {

  final _bloc = GetIt.I<BalanceBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.getBalances();
    _bloc.stream.listen((event) {
      switch(event.runtimeType){
        case ErrorBalanceState:
          _showError(event);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColor.kBackgroundColor,AppColor.kBackgroundColor],
              begin:  Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
        child: _stickList(),
      ),
    );
  }

  Widget _stickList(){
    return Stack(
      children: [
        Positioned.fill(
            top: 20,
            child: _listViewWidget()),
        Positioned(
          left: 20,
          right: 20,
          bottom: 50,
          child: _addTokenButton(),
        )
      ],
    );
  }

  Widget _listViewWidget() {
    return BlocBuilder<BalanceBloc,BaseBalanceState>(
        buildWhen: (prev,current) => current is ErrorBalanceState == false || prev is ErrorBalanceState == false,
        bloc: _bloc,
        builder: (context, state){
          switch(state.runtimeType){
            case ResultState:
              final tokensList = (state as ResultState).tokens;
              return ListViewWidget(listView: tokensList);
            default:
              return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _addTokenButton() {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight*0.05,
      child: Button(
        onClick: _displayAddNewTokenBottomSheet,
        title: "Add Token",
        enable: true,
      ),
    );
  }

  void _showError(BaseBalanceState event) {
    var _message = (event as ErrorBalanceState).message;
    GeneralAlertDialog.show(context: context, title: "Error!",message: _message,buttonTxt: "Close",onClick: ()=>print("Error"));
  }

  _displayAddNewTokenBottomSheet(){
    AddTokenBottomDialogSheet.show(context,
        onRefresh: ()=>_bloc.getBalances());
  }
}
