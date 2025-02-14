import 'package:movie_pojo/models/cast_response.dart';
import 'package:movie_pojo/models/genre_response.dart';
import 'package:movie_pojo/models/movie_details_response.dart';
import 'package:movie_pojo/models/page_response.dart';
import 'package:movie_pojo/models/screen_shots_response.dart';

abstract class GetMovieInterface {
   Future<PageResponse> getMovies(MovieRequestType type, {String? query , int id});
   Future<ScreenShotsResponse> getScreenShot(MovieRequestType type, {int id});
   Future<CastResponse> getCast(MovieRequestType type, { int id});
   Future<GenreReponse> getGenre(MovieRequestType type, { int id});
   Future <MovieDetailsResponse> getMovieDetails(MovieRequestType type, {int id});
}
enum MovieRequestType {
  topRated,
  popular,
  nowPlaying,
  trending,
  upcoming,
  getGenre,
  genre,
  search,
  cast,
  screenShot,
  similar,
  movieDetails
}
