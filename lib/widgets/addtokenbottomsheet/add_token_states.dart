enum ButtonStateType {
  LOADING,
  ENABLE,
  DISABLE
}

abstract class BaseAddTokenState {}

class InitialState extends BaseAddTokenState {}

class TextFieldTokenState extends BaseAddTokenState {
  final String? error;

  TextFieldTokenState({this.error});
}

class ButtonState extends BaseAddTokenState {
  final ButtonStateType type;

  ButtonState(this.type);
}

class FinishAddToken extends BaseAddTokenState {}