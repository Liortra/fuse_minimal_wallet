abstract class BaseSplashState {}
class LoadingState extends BaseSplashState{}
class NavigateLoginPageState extends BaseSplashState{}
class NavigateMainPageState extends BaseSplashState{}
class ErrorSplashState extends BaseSplashState{
  final String message;
  final dynamic error;

  ErrorSplashState(this.message, {this.error});
}