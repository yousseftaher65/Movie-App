abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class OnLoadingRegisterState extends RegisterStates {}

class OnSuccessRegisterState extends RegisterStates {}

class OnErrorRegisterState extends RegisterStates {
  String message;
  OnErrorRegisterState(this.message);
}
