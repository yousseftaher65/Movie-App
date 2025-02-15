abstract class MovieDetailsStates {}

class MovieDetailsInitState extends MovieDetailsStates {}

class MovieDetailsLoadingState extends MovieDetailsStates {}

class MovieDetailsSuccessState extends MovieDetailsStates {}

class MovieDetailsErrorState extends MovieDetailsStates {
  String error;
  MovieDetailsErrorState(this.error);
}

class ScreenShotLoadingState extends MovieDetailsStates {}

class ScreenShotSuccessState extends MovieDetailsStates {}

class ScreenShotErrorState extends MovieDetailsStates {
  String error;
  ScreenShotErrorState(this.error);
}

class CastLoadingState extends MovieDetailsStates {}

class CastSuccessState extends MovieDetailsStates {}

class CastErrorState extends MovieDetailsStates {
  String error;
  CastErrorState(this.error);
}

class SimilarLoadingState extends MovieDetailsStates {}


class SimilarSuccessState extends MovieDetailsStates {}
class SimilarErrorState extends MovieDetailsStates {
  String error;
  SimilarErrorState(this.error);
}
