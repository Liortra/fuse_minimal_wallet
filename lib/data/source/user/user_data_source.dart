import 'package:get_it/get_it.dart';

abstract class UserLocalDataSource {
  Future<String?> loadUserAddress();

  Future<void> saveUserAddress(String userAddress);

  Future<bool> checkUserAddressExist();

  Future<void> deleteUserAddress();
}

abstract class BaseUserAddressDataSource {
  final _userLocalDataSource = GetIt.I<UserLocalDataSource>();

  Future<String> loadUserAddress()=> _userLocalDataSource.loadUserAddress().then((value) => value!);

  Future<void> deleteUserAddress()=> _userLocalDataSource.deleteUserAddress();
}