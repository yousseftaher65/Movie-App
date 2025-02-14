import 'package:movie_pojo/core/cubit/base_states.dart';

class HomeTabLoadingState extends BaseStates {}

class HomeTabSuccessState extends BaseStates {}

class HomeTabErrorState extends BaseStates {
  String error;
  HomeTabErrorState(this.error);
}
