abstract class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}

class OnLoadingForgetPasswordState extends ForgetPasswordStates {}

class OnSuccessForgetPasswordState extends ForgetPasswordStates {}

class OnErrorForgetPasswordState extends ForgetPasswordStates {
  String message;

  OnErrorForgetPasswordState(this.message);
}
