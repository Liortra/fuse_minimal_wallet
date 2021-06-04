abstract class FuseExceptions extends ArgumentError {
  final String message;

  FuseExceptions({required this.message}) {
    print("~~~~~~FuseExceptions: something went wrong error: $message");
  }
}

class NotExistsInCache extends FuseExceptions {
  NotExistsInCache({required String message}) : super(message: message);
}
