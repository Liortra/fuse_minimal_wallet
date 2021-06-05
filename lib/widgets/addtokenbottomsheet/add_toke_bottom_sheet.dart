import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/widgets/addtokenbottomsheet/add_token_bloc.dart';
import 'package:fuse_minimal_wallet/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

import 'add_token_states.dart';

class AddTokenBottomDialogSheet {
  static Future<void> show(BuildContext context, {required Function() onRefresh}) {
    return showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (_) => AddTokenWidget(onRefresh: onRefresh,));
  }
}

class AddTokenWidget extends StatefulWidget {
  final Function() onRefresh;

  const AddTokenWidget({Key? key, required this.onRefresh}) : super(key: key);

  @override
  _AddTokenWidgetState createState() => _AddTokenWidgetState();
}

class _AddTokenWidgetState extends State<AddTokenWidget> {

  StreamSubscription? _streamSubscription;
  final _bloc = GetIt.I<AddTokenBloc>();
  final _textEditorController = TextEditingController();


  @override
  void initState() {
    super.initState();
    if(kDebugMode){
      // FUSE.IO, you can change it or put it in comment
      _textEditorController.text = "0x495d133b938596c9984d462f007b676bdc57ecec";
    }

    _streamSubscription = _bloc.stream
        .where((state) => state is FinishAddToken)
        .listen((_) {
          widget.onRefresh();
          Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _title(),
            SizedBox(height: 10,),
            Expanded(child: _editTextToken()),
            SizedBox(height: 10,),
            Expanded(child: _errorText()),
            SizedBox(height: 10,),
            Expanded(child: _button()),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Add new Token",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        IconButton(
            color: Colors.black,
            iconSize: 20,
            onPressed: ()=> Navigator.pop(context),
            icon: Icon(Icons.clear)),
      ],
    );
  }

  Widget _editTextToken() {
    return BlocBuilder<AddTokenBloc, BaseAddTokenState>(
        bloc: _bloc,
        buildWhen: (prev, current) => current is TextFieldTokenState,
        builder: (context, state) {
          final error = (state is TextFieldTokenState) ? state.error : null;
          print("show edit text state: $error");
          return EditText(
            textStyle: TextStyle(color: Colors.black),
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            hint: "Token",
            error: error,
            controller: _textEditorController,
            onChange: (input) => _bloc.validToken(input),
          );
        });
  }

  Widget _button() {
    return AnimatedSwitcher(
      transitionBuilder: (child,anim)=> ScaleTransition(scale: anim,child: child,),
      duration: Duration(milliseconds: 300),
      child: BlocBuilder<AddTokenBloc, BaseAddTokenState>(
          bloc: _bloc,
          buildWhen: (prev, current) => current is ButtonState,
          builder: (context, state) {
            final type = (state is ButtonState) ? state.type : ButtonStateType.DISABLE;
            print("show button state: $type");
            final button = Button(
              title: 'Submit',
              enable: type == ButtonStateType.ENABLE,
              onClick: () => _bloc.submitToken(),
            );
            final loader = CircularProgressIndicator();
            return type == ButtonStateType.LOADING ? loader : button;
          }),
      );
  }
  
  Widget _errorText(){
    return BlocBuilder<AddTokenBloc, BaseAddTokenState>(
        bloc: _bloc,
        buildWhen: (prev, current) => current is ErrorAddTokenState,
        builder: (context, state) {
          final error = (state is ErrorAddTokenState) ? state.message : " ";
          print("show edit text state: $error");
          return Text("$error",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,);
        });
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription?.cancel();
  }
}
