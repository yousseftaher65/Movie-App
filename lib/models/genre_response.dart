class GenreReponse {
  List<Genres>? genres;
  num? statusCode;
  String? statusMessage;
  bool? success;
  GenreReponse(
      {this.genres, this.statusCode, this.statusMessage, this.success});

  GenreReponse.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"];
    statusMessage = json["status_message"];
    success = json["success"];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
  }
}

class Genres {
  int? id;
  String? name;
  num? statusCode;
  String? statusMessage;
  bool? success;
  Genres(
      {this.id, this.name, this.statusCode, this.statusMessage, this.success});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    statusCode = json["status_code"];
    statusMessage = json["status_message"];
    success = json["success"];
  }
}
