import 'package:movie_pojo/models/results.dart';

class PageResponse {
  int? page;
  num? statusCode;
  String? statusMessage;
  bool? success;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PageResponse(
      {this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.statusCode,
      this.statusMessage,
      this.success});

  PageResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    statusCode = json["status_code"];
    statusMessage = json["status_message"];
    success = json["success"];
  }
}
