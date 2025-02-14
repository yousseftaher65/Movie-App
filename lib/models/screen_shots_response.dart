class ScreenShotsResponse {
  List<Backdrops>? backdrops;
  int? id;
  num? statusCode;
  String? statusMessage;
  bool? success;

  ScreenShotsResponse(
      {this.backdrops,
      this.id,
      this.statusCode,
      this.statusMessage,
      this.success});

  ScreenShotsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"];
    statusMessage = json["status_message"];
    success = json["success"];
    if (json['backdrops'] != null) {
      backdrops = <Backdrops>[];
      json['backdrops'].forEach((v) {
        backdrops!.add(Backdrops.fromJson(v));
      });
    }
    id = json['id'];
  }
}

class Backdrops {
  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;
  num? statusCode;
  String? statusMessage;
  bool? success;

  Backdrops(
      {this.aspectRatio,
      this.height,
      this.iso6391,
      this.filePath,
      this.voteAverage,
      this.voteCount,
      this.width,
      this.statusCode,
      this.statusMessage,
      this.success});

  Backdrops.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
    statusCode = json["status_code"];
    statusMessage = json["status_message"];
    success = json["success"];
  }
}
