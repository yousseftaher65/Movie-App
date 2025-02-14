import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_pojo/core/cubit/forget_password_maneger/forget_password_cubit.dart';
import 'package:movie_pojo/core/cubit/forget_password_maneger/forget_password_states.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';
import 'package:movie_pojo/core/theme/app_colors.dart';
import 'package:movie_pojo/ui/widgets/elevated_btn.dart';

import '../../../core/theme/base_theme.dart';
import '../../widgets/auth.btn.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('forgot_password'.tr()),
      ),
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
          listener: (context, state) {
            if (state is OnErrorForgetPasswordState) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('something_went_wrong'.tr(),),
                  content: Text(state.message),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('ok'.tr()),
                    )
                  ],
                ),
              );
            } else if (state is OnLoadingForgetPasswordState) {
              showDialog(
                context: context,
                builder: (_) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  title: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.accentColor,
                    ),
                  ),
                ),
              );
            } else if (state is OnSuccessForgetPasswordState) {
              Navigator.pushNamed(context, PageRouteName.logIn);
              Fluttertoast.showToast(
                msg: "check_your_email".tr(),
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
            var bloc = BlocProvider.of<ForgetPasswordCubit>(context);
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image(
                          image: const AssetImage(
                              "assets/images/forgot_password.png"),
                          width: 430.w,
                          height: 430.h,
                        ),
                        //Email Btn
                        AuthBtn(
                          show: false,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                            child: const ImageIcon(
                              AssetImage(
                                "assets/icons/email_icon.png",
                              ),
                            ),
                          ),
                          tittle: "email".tr(),
                          textEditingController: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please_enter_email'.tr();
                            }
                            final emailRegex = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'please_enter_valid_email'.tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        ElevatedBtn(
                          lable: "verify_email".tr(),
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              bloc.forgotPassword(emailController.text);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
