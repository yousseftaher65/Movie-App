import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_pojo/core/cubit/register_maneger/register_states.dart';
import '../../firebase/firebase_manegers.dart';
import '../../models/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  ///Register
  void register(
    String name,
    String emailAddress,
    String password,
    String phone,
    int imageIndex,
  ) async {
    try {
      emit(OnLoadingRegisterState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      UserModel model = UserModel(
        name: name,
        email: emailAddress,
        id: credential.user!.uid,
        phoneNumber: phone,
        imageIndex: imageIndex,
      );
      await FireBaseManager.addUser(model);
      credential.user!.sendEmailVerification();
      emit(OnSuccessRegisterState());
    } on FirebaseAuthException catch (e) {
      String error = "" ;
      if (e.code == 'weak-password') {
        error = "password_must_be_8_characters".tr();
        emit(OnErrorRegisterState(error));
      } else if (e.code == 'email-already-in-use') {
        error = "email_already_exist".tr();
        emit(OnErrorRegisterState(error));
      }
    } catch (e) {
      emit(OnErrorRegisterState("something_went_wrong".tr()));
      print("something_went_wrong");
    }
  }
}
