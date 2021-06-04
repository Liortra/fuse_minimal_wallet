import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuse_minimal_wallet/data/model/fusehttperror/fuse_http_error.dart';
import 'package:fuse_minimal_wallet/data/source/balance/balance_repository.dart';
import 'package:fuse_minimal_wallet/data/source/token/token_repository.dart';
import 'package:fuse_minimal_wallet/data/model/token/token.dart';
import 'balance_states.dart';

class BalanceBloc extends Cubit<BaseBalanceState> {
  final BalanceRepository _balanceRepository;
  final TokenRepository _tokenRepository;

  BalanceBloc(this._balanceRepository, this._tokenRepository) : super(LoadingBalanceState());

  getBalances() async {
    try {
      final results = await Future.wait([_balanceRepository.getBalance(),_tokenRepository.getTokens()]);
      final balance = results[0] as String?;
      final tokens = results[1] as List<Token>;
      final tokenSet = tokens.toSet();
      if(balance!= null) tokenSet.add(Token.fromBalance(balance));
      emit(ResultState(tokenSet.toList()));
    } on FuseHttpError catch (e) {
      emit(ErrorBalanceState(e.message, error: e));
    } catch(e){
      var message = "Catch: Something wrong, check again";
      emit(ErrorBalanceState(message, error: e));
    }
  }

  addToken(String contractAddressHash){

  }
}
