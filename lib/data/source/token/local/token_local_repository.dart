import 'package:fuse_minimal_wallet/data/model/token/token.dart';
import 'package:fuse_minimal_wallet/data/source/token/token_data_source.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';

class TokenLocalRepository extends BaseUserAddressDataSource implements TokenDataSourceLocal {
  List<Token> _tokensCache = [];

  @override
  Future<List<Token>> loadTokens() async {
    return _tokensCache;
  }

  @override
  Future<void> saveTokens(List<Token> tokens) async {
    _tokensCache = tokens;
  }

  @override
  Future<void> addNewToken(Token token) async {
    for(var temp in _tokensCache){
      if(temp.symbol == token.symbol)
        throw Exception("Token already exist");
    }
    _tokensCache.add(token);
  }
}
