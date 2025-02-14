import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_pojo/core/cubit/login_maneger/login_states.dart';

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
        print("email_not_verified");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        emit(OnErrorLoginState("wrong_password".tr()));
        // print(e.code);
      } else if (e.code == "user-not-found") {
        emit(OnErrorLoginState("email_not_found".tr()));
        // print("user-not-found");
      } else {
        emit(OnErrorLoginState("unknown_error"));
        // print("errrrrrrrr + ${e.code.toString()}");
      }
    }
  }
}
