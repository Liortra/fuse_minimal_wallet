import 'package:fuse_minimal_wallet/data/model/contract/contract.dart';
import 'package:fuse_minimal_wallet/data/model/token/token.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';

abstract class TokenDataSourceLocal extends BaseUserAddressDataSource{
  Future<void> saveTokens(List<Token> tokens);

  Future<List<Token>> loadTokens();

  Future<void> addNewToken(Token token);
}

abstract class TokenDataSourceRemote {
  Future<List<Token>> getTokens(String addressHash);

  Future<Contract?> addNewToken(String newHashAddress);


}
