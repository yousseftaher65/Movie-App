abstract class HomeStates {}

class HomeInitStates extends HomeStates {}

class HomeTabLoadingState extends HomeStates {}

class HomeTabSuccessState extends HomeStates {}

class HomeTabErrorState extends HomeStates {
  String error;
  HomeTabErrorState(this.error);
}
