import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pojo/core/cubit/search_cubit/states.dart';
import 'package:movie_pojo/core/repository/get_movie_interface.dart';
import 'package:movie_pojo/models/page_response.dart';

class SearchCubit extends Cubit<SearchStates> {
  String lastQuery = '';
  PageResponse? searchResponse;
  GetMovieInterface getMovieInterface;
  SearchCubit(this.getMovieInterface) : super(SearchInitState());

  void maybePerformSearch(String newQuery) async {
    final currentQuery = newQuery.trim();

    if (currentQuery.isEmpty) {
      lastQuery = '';
      emit(EmptySearchState());
      return;
    }
    if (currentQuery == lastQuery) return;

    lastQuery = currentQuery;

    await getSearch(currentQuery); 
  }

  Future<void> getSearch(String query) async {
    try {
      emit(SearchLoadingState());
      searchResponse = await getMovieInterface
          .getMovies(MovieRequestType.search, query: query);
      {
        if (searchResponse?.results != null) {
          emit(SearchSuccessState());
        } else {
          emit(SearchErrorState(
              searchResponse?.statusMessage ?? 'Somthing went wrong'));
        }
      }
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}
