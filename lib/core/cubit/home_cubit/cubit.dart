import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pojo/core/cubit/base_states.dart';
import 'package:movie_pojo/core/cubit/home_cubit/states.dart';
import 'package:movie_pojo/core/repository/get_movie_interface.dart';
import 'package:movie_pojo/models/page_response.dart';

class HomeTabCubit extends Cubit<BaseStates> {
  PageResponse? nowPlayingMovies;
  PageResponse? trendingMovies;
  PageResponse? upcomingMovies;
  PageResponse? topRatedMovies;
  PageResponse? popularMovies;
  GetMovieInterface getMovieInterface;
  HomeTabCubit(this.getMovieInterface) : super(HomeInitStates());
  
  static HomeTabCubit get(context) => BlocProvider.of(context);

  Future<void> getMovie() async {
    try {
      emit(HomeTabLoadingState());
      nowPlayingMovies =
          await getMovieInterface.getMovies(MovieRequestType.nowPlaying);
      trendingMovies =
          await getMovieInterface.getMovies(MovieRequestType.trending);
      upcomingMovies =
          await getMovieInterface.getMovies(MovieRequestType.upcoming);
      topRatedMovies =
          await getMovieInterface.getMovies(MovieRequestType.topRated);
      popularMovies =
          await getMovieInterface.getMovies(MovieRequestType.popular);
    if (nowPlayingMovies?.results == null ||
          trendingMovies?.results == null ||
          upcomingMovies?.results == null ||
          topRatedMovies?.results == null ||
          popularMovies?.results == null){
        emit(HomeTabErrorState(nowPlayingMovies?.statusMessage ?? "Something went wrong"));
      } else {
        emit(HomeTabSuccessState());
      }    
    } catch (e) {
      emit(HomeTabErrorState(e.toString()));
    }
  }
}
