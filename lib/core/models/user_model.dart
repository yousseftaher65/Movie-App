class UserModel {
  String? name;

  String? email;
  String? id;
  String? phoneNumber;
  int? imageIndex;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.phoneNumber,
    required this.imageIndex,
  });

  UserModel.frmJson(Map<String , dynamic> json):this (
    name: json['name'] as String,
    email: json['email'] as String,
    id: json['id'] as String,
    phoneNumber: json['phone_number'] as String,
    imageIndex: json['image_index'] as int,
  );

  Map<String , dynamic>toJson (){
    return {
      'name': name,
      'email': email,
      'id': id,
      'phone_number': phoneNumber,
      'image_index': imageIndex,
    };
  }
}
