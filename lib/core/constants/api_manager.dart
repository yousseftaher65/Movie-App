class ApiManager {
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String searchEndPoint = '$baseUrl/3/search/movie';
  static const String nowPlayingEndPoint = '$baseUrl/3/movie/now_playing?$apiKey';
  static const String popularEndPoint = '$baseUrl/3/movie/popular?$apiKey';
  static const String topRatedEndPoint = '$baseUrl/3/movie/top_rated?$apiKey';
  static const String upcomingEndPoint = '$baseUrl/3/movie/upcoming?$apiKey';
  static const String trendingEndPoint = '$baseUrl/3/trending/movie/week?$apiKey';
  static const String getgenreEndPoint = '$baseUrl/3/discover/movie?$apiKey&with_genres=';
  static const String genreEndPoint = '$baseUrl/3/genre/movie/list?$apiKey';
  static const String apiKey = 'api_key=ee933ce6928cd072b3c9670babf2265c';

  /* Future<PageResponse> getTopRated() async {
    try {
      Uri url = Uri.parse(baseUrl + topRatedEndPoint + apiKey);
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      PageResponse pageResponse = PageResponse.fromJson(jsonData);
      return pageResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<PageResponse> getPopularMovies() async {
    try {
      Uri url = Uri.parse(baseUrl + popularEndPoint + apiKey);
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      PageResponse pageResponse = PageResponse.fromJson(jsonData);
      return pageResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<PageResponse> getNowPlaying() async {
    try {
      Uri url = Uri.parse(baseUrl + nowPlayingEndPoint + apiKey);
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      PageResponse pageResponse = PageResponse.fromJson(jsonData);
      return pageResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
  Future<PageResponse> getTrending() async {
    try {
      Uri url = Uri.parse("$baseUrl/3/trending/movie/week$apiKey");
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      PageResponse pageResponse = PageResponse.fromJson(jsonData);
      return pageResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<PageResponse> getUpcoming() async {
    try {
      Uri url = Uri.parse(baseUrl + upcomingEndPoint + apiKey);
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      PageResponse pageResponse = PageResponse.fromJson(jsonData);
      return pageResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<PageResponse> getSearch(String query) async {
    try {
      //
      Uri url = Uri.parse(
          "$baseUrl$searchEndPoint?query=$query&api_key=ee933ce6928cd072b3c9670babf2265c");
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      PageResponse pageResponse = PageResponse.fromJson(jsonData);
      return pageResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<ScreenShotsResponse> getScreenShot(int movieId) async {
    try {
      Uri url = Uri.parse("$baseUrl/3/movie/$movieId/images$apiKey");
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      ScreenShotsResponse screenShotsResponse =
          ScreenShotsResponse.fromJson(jsonData);
      return screenShotsResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<CastResponse> getCast(int movieId) async {
    try {
      Uri url = Uri.parse("$baseUrl/3/movie/$movieId/credits$apiKey");
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      CastResponse castResponse = CastResponse.fromJson(jsonData);
      return castResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<PageResponse> getSimilar(int movieId) async {
    try {
      Uri url = Uri.parse("$baseUrl/3/movie/$movieId/similar$apiKey");
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      PageResponse pageResponse = PageResponse.fromJson(jsonData);
      return pageResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  Future<GenreReponse> getGenre() async {
    try {
      Uri url = Uri.parse(baseUrl+genreEndPoint+apiKey);
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      GenreReponse genreResponse = GenreReponse.fromJson(jsonData);
      return genreResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
  Future<PageResponse> getExplore(int genreId) async {
    try {
      Uri url = Uri.parse("$baseUrl/3/discover/movie?$apiKey&with_genres=$genreId");
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      PageResponse pageResponse = PageResponse.fromJson(jsonData);
      return pageResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  } */

}
