import 'package:fuse_minimal_wallet/data/model/token/token.dart';

abstract class BaseBalanceState {}

class LoadingBalanceState extends BaseBalanceState {}

class ResultState extends BaseBalanceState {
  final List<Token> tokens;

  ResultState(this.tokens);
}

class ErrorBalanceState extends BaseBalanceState {
  final String message;
  final dynamic error;

  ErrorBalanceState(this.message, {this.error});
}
