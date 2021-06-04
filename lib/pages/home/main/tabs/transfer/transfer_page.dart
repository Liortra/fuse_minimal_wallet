import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/model/transfer/transfer.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/transfer/transfer_bloc.dart';
import 'package:fuse_minimal_wallet/pages/home/main/tabs/transfer/transfer_states.dart';
import 'package:fuse_minimal_wallet/utils/utils.dart';
import 'package:fuse_minimal_wallet/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class TransferPage extends StatefulWidget {
  TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {

  final _bloc = GetIt.I<TransferBloc>();
  @override
  void initState() {
    super.initState();
    _bloc.getTransfers();
    _bloc.stream.listen((event) {
      switch(event.runtimeType){
        case ErrorTransferState:
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
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.spacing_normal_horizontal),
          child: _listViewWidget(),
        ),
      ),
    );
  }

  Widget _listViewWidget() {
    return BlocBuilder<TransferBloc,BaseTransferState>(
        buildWhen: (prev,current) => current is ResultState,
        bloc: _bloc,
        builder: (context, state){
          switch(state.runtimeType){
            case ResultState:
              final transfersList = (state as ResultState).transfers;
              return ListViewWidget(listView: transfersList,);
            default:
              return Center(child: CircularProgressIndicator());
          }
        });
  }

  void _showError(BaseTransferState event) {
    var _message = (event as ErrorTransferState).message;
    GeneralAlertDialog.show(context: context, title: "Error!",message: _message,buttonTxt: "Close",onClick: ()=>print("Error"));
  }
}
