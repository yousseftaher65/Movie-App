import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pojo/core/cubit/explore_cubit/states.dart';
import 'package:movie_pojo/core/repository/get_movie_interface.dart';
import 'package:movie_pojo/models/genre_response.dart';
import 'package:movie_pojo/models/page_response.dart';
import 'package:movie_pojo/models/results.dart';

class ExploreCubit extends Cubit<ExploreStates> {
  List<Results>? loadedMovies = [];
  bool isFetching = false; // <-- flag to prevent multiple calls
  int currentIndex = 0;
  int currentPage = 1;
  bool hasMorePages = true;
  PageResponse? pageResponse;
  GenreReponse? genreReponse;
  GetMovieInterface getMovieInterface;
  ExploreCubit(this.getMovieInterface) : super(ExploreInitState());
  static ExploreCubit get(context) => BlocProvider.of(context);

  void changeGenre(int isSelected) async {
    currentIndex = isSelected;
    await getMovie();
    emit(ChangeGenre());
  }

  Future<void> getMovie({int? page}) async {
     // Prevent multiple calls if already fetching
    if (isFetching) return;
    isFetching = true;
    
    try {
      if (page == null || page == 1) {
        currentPage = 1;
        hasMorePages = true;
        loadedMovies?.clear(); // clear accumulated list for new fetch (or genre change)
        emit(ExploreLoadingState());
        // Fetch genres only once (or on refresh)
        genreReponse = await getMovieInterface.getGenre(MovieRequestType.genre);
      } else {
        currentPage = page;
      }

      pageResponse = await getMovieInterface.getMovies(
        MovieRequestType.getGenre,
        id: genreReponse?.genres?[currentIndex].id,
        page: currentPage,
      );

      if (pageResponse != null && pageResponse?.results != null) {
        if (currentPage == 1) {
          loadedMovies = pageResponse?.results!;
        } else {
          loadedMovies?.addAll(pageResponse!.results!);
        }
        // Check if we've reached the last page
        if (currentPage >= (pageResponse?.totalPages ?? 1)) {
          hasMorePages = false;
        }
        emit(ExploreSuccessState());
      } else {
        emit(ExploreErrorState("Something went wrong"));
      }
    } catch (e) {
      emit(ExploreErrorState(e.toString()));
    } finally {
      isFetching = false;
    }
  }

  /* Future<void> getMovie() async {
    try {
      emit(ExploreLoadingState());
      genreReponse = await getMovieInterface.getGenre(MovieRequestType.genre);
      pageResponse = await getMovieInterface.getMovies(
          MovieRequestType.getGenre,
          id: genreReponse?.genres?[currentIndex].id);
      if (genreReponse?.genres != null && pageResponse?.results != null) {
        emit(ExploreSuccessState());
      } else {
        emit(ExploreErrorState(genreReponse?.statusMessage ??
            pageResponse?.statusMessage ??
            "something went wrong"));
      }
    } catch (e) {
      emit(ExploreErrorState(e.toString()));
    }
  } */
}
