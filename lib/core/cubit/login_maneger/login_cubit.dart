import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_pojo/core/cubit/login_maneger/login_states.dart';
import 'package:movie_pojo/core/firebase/firebase_manegers.dart';
import 'package:movie_pojo/core/models/user_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  /// Login
  void logIn(
    String emailAddress,
    String password,
  ) async {
    try {
      emit(OnLoadingLoginState());
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credentials.user!.emailVerified) {
        emit(OnSuccessLoginState());
      } else {
        emit(OnErrorLoginState("email_not_verified".tr()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        emit(OnErrorLoginState("wrong_password".tr()));
        // print(e.code);
      } else if (e.code == "user-not-found") {
        emit(OnErrorLoginState("email_not_found".tr()));
        // print("user-not-found");
      } else {
        emit(OnErrorLoginState("email_or_password_not_correct".tr()));
      }
    }
  }

  /// Login with google
  void signInWithGoogle() async {
    try {
      emit(OnLoadingLoginState());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        emit(OnErrorLoginState(''));
        return; // The user canceled the sign-in
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final existUser = await FireBaseManager.getUserCollection()
          .doc(userCredential.user!.uid)
          .get();

      if (userCredential.user != null) {
        UserModel userModel = UserModel(
            email: userCredential.user!.email ?? "",
            name:
                (existUser.data() != null && existUser.data()!.name!.isNotEmpty)
                    ? existUser.data()?.name
                    : userCredential.user?.displayName ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            imageIndex:
                existUser.data() != null ? existUser.data()!.imageIndex : 0,
            id: userCredential.user!.uid);
        FireBaseManager.addUser(userModel);
      }
      emit(OnSuccessLoginState());
    } on FirebaseAuthException catch (e) {
      emit(OnErrorLoginState(e.toString()));
    } catch (e) {
      emit(OnErrorLoginState(e.toString()));
    }
  }
}
