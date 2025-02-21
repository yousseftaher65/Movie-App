import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pojo/core/cubit/edit_profile_cubit/states.dart';
import 'package:movie_pojo/core/firebase/firebase_manegers.dart';
import 'package:movie_pojo/core/models/user_model.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  UserModel? userModel;
  EditProfileCubit(this.userModel) : super(EditProfileInitialState());

  

  static EditProfileCubit get(context) => BlocProvider.of(context);


  /// Delete User
  void deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  /// Delete User Data
 Future<void> deleteUserData(String? userId) async {
    var deleteUser =  FireBaseManager.getUserCollection();
    return await deleteUser.doc(userId).delete();
  }

  /// Update User Data
  void updateDataUser({required UserModel model,required String? userId}) async{
    emit(EditProfileLoadingState());
    try {
      // Update user data
      var updateUserData =  FireBaseManager.getUserCollection();
       updateUserData.doc(userId).update(
        {
          'name': model.name,
          'image_index': model.imageIndex,
        },
      );
      emit(EditProfileSuccessState());
    } catch (e) {
      emit(EditProfileErrorState(e.toString()));
    }
  }
}
