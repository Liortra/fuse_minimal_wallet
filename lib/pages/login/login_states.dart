abstract class BaseLoginState {}

class DefaultLoginState extends BaseLoginState {
  final bool enable;

  DefaultLoginState(this.enable);
}

class LoadingLoginState extends BaseLoginState {}

class FinishLoginState extends BaseLoginState {
  FinishLoginState();
}

class ErrorLoginState extends BaseLoginState {
  final String message;
  final dynamic error;

  ErrorLoginState(this.message, {this.error});
}
