import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/pages/home/main/main_page.dart';
import 'package:fuse_minimal_wallet/pages/login/login_bloc.dart';
import 'package:fuse_minimal_wallet/pages/login/login_states.dart';
import 'package:fuse_minimal_wallet/utils/constants/app_color.dart';
import 'package:fuse_minimal_wallet/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _bloc = GetIt.I.get<LoginBloc>();
  final _textEditorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(kDebugMode){
      // FUSE.IO, you can change it or put it in comment
      _textEditorController.text = "0x71D4FbA2bF3cA87c7555963428595Bb2B2da03b0";
    }

    _bloc.stream.listen((event) {
      switch(event.runtimeType){
        case FinishLoginState:
          _moveToMain();
          break;
        case ErrorLoginState:
          _showError(event);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100),
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColor.kBackgroundColor,AppColor.kBackgroundColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            children: <Widget>[
              _imageWidget(),
              _headlineSection(),
              BlocBuilder<LoginBloc, BaseLoginState>(
                  bloc: _bloc,
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case LoadingLoginState:
                        return CircularProgressIndicator();
                      case DefaultLoginState:
                        final enable = (state as DefaultLoginState).enable;
                        return _userDetails(enable);
                      default:
                        return _userDetails(false);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageWidget() {
    return Logo(path: 'assets/images/fuse.png');
  }

  Widget _userDetails(bool enable) {
    return Column(
      children: <Widget>[
        _textSection(),
        _buttonSection(enable),
      ],
    );
  }

  Widget _headlineSection() {
    return Text(
      "Sign in",
      style: Theme.of(context).textTheme.headline4,
    );
  }

  Widget _textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _txtField(
              "Fuse Account",
              Icon(Icons.alternate_email,color: AppColor.kPrimaryColor,),
              TextInputType.name),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _buttonSection(bool enable) {
    return Container(
      width: SizeConfig.screenWidth,
      height: 40,
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Button(
          onClick: () => _bloc.login(),
          title: "Login",
          enable: enable,
      ),
    );
  }

  Widget _txtField(String title, Icon icon, TextInputType name) {
    return EditText(
        hint: title,
        icon: icon,
        controller: _textEditorController,
        onChange: (text) => _bloc.validField(text),
        textInputType: name);
  }

  void _moveToMain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return MainPage();
      }),
    );
  }

  void _showError(BaseLoginState event) {
    var _message = (event as ErrorLoginState).message;
    GeneralAlertDialog.show(context: context, title: "Error!",message: _message,buttonTxt: "Close",onClick: ()=>print("Error"));
  }
}
