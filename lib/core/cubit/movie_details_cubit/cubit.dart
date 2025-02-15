import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pojo/core/cubit/movie_details_cubit/states.dart';
import 'package:movie_pojo/core/repository/get_movie_interface.dart';
import 'package:movie_pojo/models/cast_response.dart';
import 'package:movie_pojo/models/movie_details_response.dart';
import 'package:movie_pojo/models/page_response.dart';
import 'package:movie_pojo/models/screen_shots_response.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  int movieId;
  MovieDetailsResponse? movieDetailsResponse;
  ScreenShotsResponse? screenShotsResponse;
  PageResponse? pageResponse;
  CastResponse? castResponse;
  GetMovieInterface getMovieInterface;
  MovieDetailsCubit(this.movieId, this.getMovieInterface)
      : super(MovieDetailsInitState());

  void getDetails() async {
    try {
      emit(MovieDetailsLoadingState());
      movieDetailsResponse = await getMovieInterface
          .getMovieDetails(MovieRequestType.movieDetails, id: movieId);
      await getImages();
      await getSimilar();
      await getCredits();
      if (movieDetailsResponse?.statusMessage == null &&
          pageResponse?.statusMessage == null &&
          screenShotsResponse?.statusMessage == null &&
          castResponse?.statusMessage == null) {
        emit(MovieDetailsSuccessState());
      } else {
        emit(MovieDetailsErrorState(movieDetailsResponse?.statusMessage ??
            screenShotsResponse?.statusMessage ??
            castResponse?.statusMessage ??
            pageResponse?.statusMessage ??
            'someting went wrong'));
      }
    } catch (e) {
      print("==================================$e===========================");
      emit(MovieDetailsErrorState(e.toString()));
    }
  }

  Future<void> getImages() async {
    screenShotsResponse = await getMovieInterface
        .getScreenShot(MovieRequestType.screenShot, id: movieId);
  }

  Future<void> getCredits() async {
    castResponse =
        await getMovieInterface.getCast(MovieRequestType.cast, id: movieId);
  }

  Future<void> getSimilar() async {
    pageResponse = await getMovieInterface.getMovies(MovieRequestType.similar,
        id: movieId);
  }
}
