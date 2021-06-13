
abstract class BaseMainState {}

class LoadingMainState extends BaseMainState {}

class ResultState extends BaseMainState {
  final String balance;

  ResultState(this.balance);
}

class LogoutState extends BaseMainState {}

class ErrorMainState extends BaseMainState {
  final String message;
  final dynamic error;

  ErrorMainState(this.message, {this.error});
}
