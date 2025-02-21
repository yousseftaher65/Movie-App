import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_pojo/core/cubit/user_profile_cubit/user_profile_cubit.dart';
import 'package:movie_pojo/core/cubit/user_profile_cubit/user_profile_states.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';
import 'package:movie_pojo/ui/widgets/avater_dialog_widget.dart';
import '../../../core/models/user_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/base_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int currentIndex = 0;
  TextEditingController nameController = TextEditingController();

  void _updateAvatarIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit()..initUser(),
      child: BlocConsumer<UserDataCubit, UserDataStates>(
        listener: (context, state) {
          if (state is UpdateDataUserErrorState) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'something_went_wrong'.tr(),
                ),
                content: Text(
                  state.message,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "ok".tr(),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is UpdateDataUserLoadingState) {
            showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                backgroundColor: Colors.transparent,
                title: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.accentColor,
                  ),
                ),
              ),
            );
          } else if (state is UpdateDataUserSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, PageRouteName.home, (_) => false);
            Fluttertoast.showToast(
              msg: "profile_updated_successfully".tr(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: AppColors.whiteColor,
              textColor: AppColors.primaryColor,
              fontSize: BaseTheme.contentTxt.fontSize,
            );
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<UserDataCubit>(context);
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text(
                  'pick_avater'.tr(),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          return await showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return AvaterDialogWidget(
                                  onAvatarSelected: _updateAvatarIndex);
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 36.h),
                          child: Image.asset(
                            'assets/images/avater_${currentIndex + 1}.png',
                            fit: BoxFit.contain,
                            height: 150.h,
                            width: 150.w,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      autocorrect: true,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'name'.tr(),
                      ),
                      controller: nameController,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        bloc.deleteUser();
                        bloc.deleteUserData(bloc.userModel!.id);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          PageRouteName.logIn,
                          (context) => false,
                        );
                        Fluttertoast.showToast(
                          msg: "account_deleted_successfully".tr(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: AppColors.whiteColor,
                          textColor: AppColors.primaryColor,
                          fontSize: BaseTheme.contentTxt.fontSize,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).focusColor),
                      child: Text(
                        'delete_account'.tr(),
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                      ),
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        UserModel model = UserModel(
                            name: nameController.text.isEmpty
                                ? bloc.userModel!.name
                                : nameController.text,
                            id: bloc.userModel!.id,
                            imageIndex: currentIndex != 0
                                ? currentIndex
                                : bloc.userModel!.imageIndex);
                        bloc.updateUserData(model, bloc.userModel!.id);
                      },
                      child: Text(
                        'update_data'.tr(),
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                    ),
                    SizedBox(
                      height: 33.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
