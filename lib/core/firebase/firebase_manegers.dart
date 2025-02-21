import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_pojo/core/models/user_model.dart';

class FireBaseManager {
  /// User Collection
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.frmJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  /// Add User
  static Future<void> addUser(UserModel user) {
    var createUser = getUserCollection();
    var userRef = createUser.doc(user.id);
    return userRef.set(user);
  }

  static Future<void> updateUserFavorite(String userId, int movieId) {
    var updateUserData = getUserCollection();
    return updateUserData.doc(userId).update({
      'favorite_list': FieldValue.arrayUnion([movieId])
    });
  }

  static Future<void> updateUserHistory(String userId, int movieId) {
    var updateUserData = getUserCollection();
    return updateUserData.doc(userId).update({
      'history_list': FieldValue.arrayUnion([movieId])
    });
  }

  static Future<List<int?>> getUserHistory(String userId) async {
    var getUserData = getUserCollection();
    DocumentSnapshot<UserModel> userResponse = await getUserData.doc(userId).get();
    return userResponse.data()?.historyList??[];
  }

  static Future<List<int?>> getUserFavorite(String userId) async {
    var getUserData = getUserCollection();
    DocumentSnapshot<UserModel> userResponse = await getUserData.doc(userId).get();
    return userResponse.data()?.favoriteList??[];
  }
}
