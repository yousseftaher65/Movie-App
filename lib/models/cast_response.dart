class CastResponse {
  int? id;
  List<Cast>? cast;
  num? statusCode;
  String? statusMessage;
  bool? success;

  CastResponse(
      {this.id, this.cast, this.statusCode, this.statusMessage, this.success});

  CastResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusCode = json["status_code"];
    statusMessage = json["status_message"];
    success = json["success"];
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(Cast.fromJson(v));
      });
    }
  }
}

class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  num? statusCode;
  String? statusMessage;
  bool? success;

  Cast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order,
      this.statusCode,
      this.statusMessage,
      this.success});

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    statusCode = json["status_code"];
    statusMessage = json["status_message"];
    success = json["success"];
  }
}
