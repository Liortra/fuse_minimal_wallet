class ApiConfiguration {
  // flutter pub run build_runner build
  // flutter pub run build_runner watch
  // flutter pub run build_runner build --delete-conflicting-outputs
  static const BASE_URL = 'https://explorer.fuse.io/api';


  //?module=account&action=balance&address={addressHash} - for balance
  //?module=account&action=tokentx&address={addressHash} - for transfer
  //?module=account&action=tokenlist&address={addressHash} - list of tokens
  // ?module=token&action=getToken&contractaddress={contractAddressHash} - add a token
}
