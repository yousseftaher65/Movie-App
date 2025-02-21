class UserModel {
  String? name;
  String? email;
  String? id;
  String? phoneNumber;
  int? imageIndex;
  List<int?>? favoriteList;
  List<int?>? historyList ;

  UserModel({
    this.name,
    this.email,
    this.id,
    this.phoneNumber,
    this.imageIndex,
    this.favoriteList = const [],
    this.historyList = const [],
  });

  UserModel.frmJson(Map<String , dynamic> json):this (
    name: json['name'] as String,
    email: json['email'] as String,
    id: json['id'] as String,
    phoneNumber: json['phone_number'] as String,
    imageIndex: json['image_index'] as int,
    favoriteList: List<int>.from(json['favorite_list'] ?? []),
    historyList: List<int>.from(json['history_list'] ?? []),
  );

  Map<String , dynamic>toJson (){
    return {
      'name': name,
      'email': email,
      'id': id,
      'phone_number': phoneNumber,
      'image_index': imageIndex,
      'favorite_list': favoriteList,
      'history_list': historyList,
    };
  }
}
