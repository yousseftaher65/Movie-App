import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_pojo/core/constants/api_manager.dart';
import 'package:movie_pojo/core/repository/get_movie_interface.dart';
import 'package:movie_pojo/models/cast_response.dart';
import 'package:movie_pojo/models/genre_response.dart';
import 'package:movie_pojo/models/movie_details_response.dart';
import 'package:movie_pojo/models/page_response.dart';
import 'package:movie_pojo/models/screen_shots_response.dart';

class GetMovieRepo implements GetMovieInterface {
  @override
  Future<PageResponse> getMovies(MovieRequestType type,
      {String? query, int? id}) async {
    String endpoint;
    switch (type) {
      case MovieRequestType.topRated:
        endpoint = ApiManager.topRatedEndPoint;
        break;
      case MovieRequestType.nowPlaying:
        endpoint = ApiManager.nowPlayingEndPoint;
        break;
      case MovieRequestType.popular:
        endpoint = ApiManager.popularEndPoint;
        break;
      case MovieRequestType.trending:
        endpoint = ApiManager.trendingEndPoint;
        break;
      case MovieRequestType.upcoming:
        endpoint = ApiManager.upcomingEndPoint;
        break;
      case MovieRequestType.getGenre:
        endpoint = "${ApiManager.getgenreEndPoint}$id";
        break;
      case MovieRequestType.search:
        endpoint =
            "${ApiManager.searchEndPoint}?query=$query&${ApiManager.apiKey}";
        break;
      case MovieRequestType.similar:
        endpoint =
            "${ApiManager.baseUrl}/3/movie/$id/similar?${ApiManager.apiKey}";
        break;
      default:
        throw Exception("Invalid MovieRequestType");
    }
    Uri url = Uri.parse(endpoint);
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PageResponse pageResponse = PageResponse.fromJson(jsonData);
    return pageResponse;
  }

  @override
  Future<CastResponse> getCast(MovieRequestType type, {int? id}) async {
    String endpoint;
    switch (type) {
      case MovieRequestType.cast:
        endpoint =
            "${ApiManager.baseUrl}/3/movie/$id/credits?${ApiManager.apiKey}";
        break;
      default:
        throw Exception("Invalid MovieRequestType");
    }
    Uri url = Uri.parse(endpoint);
    http.Response response = await http.get(url);
    

    if (response.statusCode != 200) {
      // You can throw a custom exception or return a failure result
      throw Exception(
          "Failed to load cast data. HTTP error: ${response.statusCode}");
    }
    var jsonData = jsonDecode(response.body);
    CastResponse castResponse = CastResponse.fromJson(jsonData);
    return castResponse;
  }

  @override
  Future<GenreReponse> getGenre(MovieRequestType type, {int? id}) async {
    String endpoint;
    switch (type) {
      case MovieRequestType.genre:
        endpoint = ApiManager.genreEndPoint;

        break;
      default:
        throw Exception("Invalid MovieRequestType");
    }
    Uri url = Uri.parse(endpoint);
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    GenreReponse genreReponse = GenreReponse.fromJson(jsonData);
    return genreReponse;
  }

  @override
  Future<ScreenShotsResponse> getScreenShot(MovieRequestType type,
      {int? id}) async {
    String endpoint;
    switch (type) {
      case MovieRequestType.screenShot:
        endpoint =
            "${ApiManager.baseUrl}/3/movie/$id/images?${ApiManager.apiKey}";
        break;
      default:
        throw Exception("Invalid MovieRequestType");
    }
    Uri url = Uri.parse(endpoint);
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    ScreenShotsResponse screenShotsResponse =
        ScreenShotsResponse.fromJson(jsonData);
    return screenShotsResponse;
  }

  @override
  Future<MovieDetailsResponse> getMovieDetails(MovieRequestType type,
      {int? id}) async {
    String endpoint;
    switch (type) {
      case MovieRequestType.movieDetails:
        endpoint = "${ApiManager.baseUrl}/3/movie/$id?${ApiManager.apiKey}";
        break;
      default:
        throw Exception("Invalid MovieRequestType");
    }
    Uri url = Uri.parse(endpoint);
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    MovieDetailsResponse movieDetailsResponse =
        MovieDetailsResponse.fromJson(jsonData);
    return movieDetailsResponse;
  }
}
