import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  // /// Get User Function
  // static Future<UserModel?> getUserData(String id) async {
  //   var getUserCollection = getUserCollection();
  //   DocumentSnapshot<UserModel> snapShot =
  //   await getUserCollection.doc(id).get();
  //   return snapShot.data();
  // }

  /// Login
  static Future<void> logIn(
    String emailAddress,
    String password,
    Function onLoading,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      onLoading();
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credentials.user!.emailVerified) {
        onSuccess();
      } else {
        onError("email_not_verified".tr());
      }
    } on FirebaseAuthException catch (_) {
      onError("email_or_password_is_not_valid".tr());
    }
  }

  /// Logout
  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
