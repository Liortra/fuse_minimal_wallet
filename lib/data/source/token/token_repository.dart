import 'package:fuse_minimal_wallet/data/model/token/token.dart';
import 'package:fuse_minimal_wallet/data/source/token/token_data_source.dart';

class TokenRepository {
  final TokenDataSourceLocal _local;
  final TokenDataSourceRemote _remote;

  TokenRepository(this._local, this._remote);

  Future<List<Token>> getTokens() {
    return _local.loadTokens()
      .then((tokens) {
        if(tokens.isNotEmpty) return tokens;
        else return _local.loadUserAddress()
            .then((addressHash) => _remote.getTokens(addressHash))
            .then((tokens) => _local.saveTokens(tokens))
            .then((_) => _local.loadTokens());
    });
  }

  Future<void> addNewToken(String newHashAddress){
    return _remote.addNewToken(newHashAddress)
        .then((contract) => _local.addNewToken(Token.fromContract(contract)));
  }
}
