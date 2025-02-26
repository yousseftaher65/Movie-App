import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_pojo/core/cubit/user_profile_cubit/user_profile_states.dart';
import 'package:movie_pojo/core/repository/get_movie_interface.dart';
import 'package:movie_pojo/models/movie_details_response.dart';
import '../../firebase/firebase_manegers.dart';
import '../../models/user_model.dart';

class UserDataCubit extends Cubit<UserDataStates> {
  UserDataCubit({this.getMovieInterface}) : super(UserDataInitialization());
  UserModel? userModel;
  UserModel? userData;
  User? currentUser;
  GetMovieInterface? getMovieInterface;
  List<MovieDetailsResponse>? historyResponse;
  List<MovieDetailsResponse>? favoriteResponse;

  static UserDataCubit get(context) => BlocProvider.of(context);

  ///Logout
  void logOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    if (user != null) {
      for (var provider in user.providerData) {
        if (provider.providerId == 'google.com') {
          // Google sign-out
          GoogleSignIn googleSignOut = GoogleSignIn();
          await googleSignOut.disconnect();
        }
      }
      await FirebaseAuth.instance.signOut();
    }
  }


  ///init User
  Future<void> initUser() async {
    currentUser = FirebaseAuth.instance.currentUser;
    try {
      emit(UserDataLoadingState());
      if (currentUser != null) {
        userModel = await getUser(currentUser?.uid ?? '');
        await loadHistoryMovies();
        await loadFavoriteMovies();
        emit(UserDataSuccessState());
      } else {
        emit(UserDataErrorState("something_went_wrong".tr()));
      }
    } catch (e) {
      emit(UserDataErrorState("something_went_wrong".tr()));
    }
  }

  /// get User Data
  getUser(String userId) async {
    var getUserData = FireBaseManager.getUserCollection();
    DocumentSnapshot<UserModel> userResponse =
        await getUserData.doc(userId).get();
    userData = userResponse.data();
    if (userData != null) {
      return userData;
    }
  }

  Future<void> loadHistoryMovies() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    // Retrieve user history from Firestore
    List<int?> historyIds = await FireBaseManager.getUserHistory(userId);

    // Fetch details for each movie ID from TMDB API
    historyResponse = await Future.wait(
      historyIds.map(
        (id) => getMovieInterface!
            .getMovieDetails(MovieRequestType.movieDetails, id: id!),
      ),
    );
  }

  Future<void> loadFavoriteMovies() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    // Retrieve user history from Firestore
    List<int?> favoriteIds = await FireBaseManager.getUserFavorite(userId);

    // Fetch details for each movie ID from TMDB API
    favoriteResponse = await Future.wait(
      favoriteIds.map(
        (id) => getMovieInterface!
            .getMovieDetails(MovieRequestType.movieDetails, id: id!),
      ),
    );
  }
}
