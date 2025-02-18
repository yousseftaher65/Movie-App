abstract class UserDataStates {}

class UserDataInitialization extends UserDataStates {}

class UserDataLoadingState extends UserDataStates {}

class UserDataSuccessState extends UserDataStates {}

class UserDataErrorState extends UserDataStates {
  String message;

  UserDataErrorState(this.message);
}
class UpdateDataUserLoadingState extends UserDataStates {}

class UpdateDataUserSuccessState extends UserDataStates {}

class UpdateDataUserErrorState extends UserDataStates {
  String message;

  UpdateDataUserErrorState(this.message);
}
