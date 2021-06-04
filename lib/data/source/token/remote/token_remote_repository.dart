import 'package:fuse_minimal_wallet/data/model/contract/contract.dart';
import 'package:fuse_minimal_wallet/data/model/token/token.dart';
import 'package:fuse_minimal_wallet/data/source/token/api/token_api.dart';
import 'package:fuse_minimal_wallet/data/source/token/token_data_source.dart';

class TokenRemoteRepository implements TokenDataSourceRemote {
  final TokenApi _tokenApi;

  TokenRemoteRepository(this._tokenApi);

  @override
  Future<List<Token>> getTokens(String addressHash) {
    return _tokenApi.getTokens(addressHash).then((response) => response.result??[]);
  }

  @override
  Future<Contract?> addNewToken(String newHashAddress) {
    return _tokenApi.addToken(newHashAddress).then((response) => response.result);
  }
}
