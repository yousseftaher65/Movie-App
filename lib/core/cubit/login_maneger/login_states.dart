abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class OnLoadingLoginState extends LoginStates {}

class OnSuccessLoginState extends LoginStates {}

class OnErrorLoginState extends LoginStates {
  String message;

  OnErrorLoginState(this.message);
}
