class ApiManager {
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String searchEndPoint = '$baseUrl/3/search/movie';
  static const String nowPlayingEndPoint = '$baseUrl/3/movie/now_playing?$apiKey';
  static const String popularEndPoint = '$baseUrl/3/movie/popular?$apiKey';
  static const String topRatedEndPoint = '$baseUrl/3/movie/top_rated?$apiKey';
  static const String upcomingEndPoint = '$baseUrl/3/movie/upcoming?$apiKey';
  static const String trendingEndPoint = '$baseUrl/3/trending/movie/week?$apiKey';
  static const String getgenreEndPoint ='$baseUrl/3/discover/movie?$apiKey';
  static const String genreEndPoint = '$baseUrl/3/genre/movie/list?$apiKey';
  static const String apiKey = 'api_key=ee933ce6928cd072b3c9670babf2265c';
}
