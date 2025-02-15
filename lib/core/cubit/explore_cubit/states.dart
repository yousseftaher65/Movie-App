abstract class ExploreStates {}
class ExploreInitState extends ExploreStates{}
class ExploreLoadingState extends ExploreStates {}

class ExploreSuccessState extends ExploreStates {}

class ExploreErrorState extends ExploreStates {
  String error;
  ExploreErrorState(this.error);
}
class ChangeGenre  extends ExploreStates{}
