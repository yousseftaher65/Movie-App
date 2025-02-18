import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_pojo/core/cubit/user_profile_cubit/user_profile_states.dart';
import '../../firebase/firebase_manegers.dart';
import '../../models/user_model.dart';

class UserDataCubit extends Cubit<UserDataStates> {
  UserDataCubit() : super(UserDataInitialization());
  UserModel? userModel;
  UserModel? userData;
  User? currentUser;

  ///Logout
  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /// Delete User
  void deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  void intUser() async {
    currentUser = FirebaseAuth.instance.currentUser;
    userModel = await getUser(currentUser?.uid ?? '');
    emit(state);
  }

  /// get User Data
  getUser(String userId) async {
    try {
      emit(UserDataLoadingState());
      var getUserData = FireBaseManager.getUserCollection();
      DocumentSnapshot<UserModel> userResponse =
          await getUserData.doc(userId).get();
      userData = userResponse.data();
      if (userData != null) {
        emit(UserDataSuccessState());
        return userData;
      } else {
        emit(UserDataErrorState("something_went_wrong".tr()));
      }
    } catch (e) {
      emit(UserDataErrorState("something_went_wrong".tr()));
    }
  }

  ///Update UserData
  updateUserData(UserModel model, String? userId) async {
    try {
      emit(UpdateDataUserLoadingState());
      var updateUserData = FireBaseManager.getUserCollection();
      updateUserData.doc(userId).update(model.toJson());
      emit(UpdateDataUserSuccessState());
    } catch (e) {
      emit(UpdateDataUserErrorState("something_went_wrong".tr()));
    }
  }

  /// Delete User Data

  deleteUserData(String? userId) {
    var deleteUser = FireBaseManager.getUserCollection();
    return deleteUser.doc(userId).delete();
  }
}
