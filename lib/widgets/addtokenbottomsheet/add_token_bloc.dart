import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/model/fusehttperror/fuse_http_error.dart';
import 'package:fuse_minimal_wallet/data/source/token/token_repository.dart';
import 'package:fuse_minimal_wallet/widgets/addtokenbottomsheet/add_token_states.dart';

class AddTokenBloc extends Cubit<BaseAddTokenState> {

  final TokenRepository _tokenRepository;
  String? _currentToken;

  AddTokenBloc(this._tokenRepository) : super(InitialState());

  validToken(String? input) async{
    _currentToken = input;
    if(input == null || input.isEmpty) {
      emit(ButtonState(ButtonStateType.DISABLE));
      emit(TextFieldTokenState(error:"text input cannot be empty"));
      return;
    }
    emit(ButtonState(ButtonStateType.ENABLE));
    emit(TextFieldTokenState());
  }

  submitToken() async{
    try{
      emit(ButtonState(ButtonStateType.LOADING));
      await _tokenRepository.addNewToken(_currentToken!);
      emit(FinishAddToken());
    }on FuseHttpError catch(e){
      emit(ErrorAddTokenState(e.message));
    } catch(e,stackTrace){
      var message = "Catch: Something wrong, check again";
      print("show error: $e stack: $stackTrace");
      emit(ErrorAddTokenState(message));
    }
    emit(ButtonState(ButtonStateType.ENABLE));
  }
}