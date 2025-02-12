import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_pojo/core/cubit/forget_password_maneger/forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());

  void forgotPassword(String emailAddress) async {
    try {
      emit(OnLoadingForgetPasswordState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      emit(OnSuccessForgetPasswordState());
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        emit(OnErrorForgetPasswordState("email_not_found".tr()));
      } else {
        emit(OnErrorForgetPasswordState("something_went_wrong".tr()));
        print("email_not_found");
      }
    }
  }
}
