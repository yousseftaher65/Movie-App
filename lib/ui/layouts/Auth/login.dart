import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_pojo/core/cubit/login_maneger/login_cubit.dart';
import 'package:movie_pojo/core/cubit/login_maneger/login_states.dart';
import 'package:movie_pojo/core/routes/page_route_name.dart';
import 'package:movie_pojo/core/theme/app_colors.dart';
import 'package:movie_pojo/core/theme/base_theme.dart';
import 'package:movie_pojo/ui/widgets/auth.btn.dart';

import '../../widgets/elevated_btn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _isObscured = true;
  bool positive = false;

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is OnLoadingLoginState) {
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
            } else if (state is OnErrorLoginState) {
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
            } else if (state is OnSuccessLoginState) {
              // await userProvider.intUser();
              Navigator.pushNamedAndRemoveUntil(
                context,
                PageRouteName.home,
                (_) => false,
              );
              Fluttertoast.showToast(
                msg: "successfully_logged_in".tr(),
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
            var bloc = BlocProvider.of<LoginCubit>(context);
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 64.0.h),
                          child: Image.asset("assets/logos/logo.png",
                              width: 150.w, height: 200.h),
                        ),
                        SizedBox(
                          height: 24.0.h,
                        ),

                        /// Email Btn
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
                              return 'please_enter_your_email'.tr();
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
                          height: 22.0.h,
                        ),

                        /// Password Btn
                        AuthBtn(
                          show: _isObscured,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                            child: const ImageIcon(
                              AssetImage(
                                "assets/icons/password_icon.png",
                              ),
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                          tittle: "password".tr(),
                          textEditingController: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please_enter_password'.tr();
                            }
                            if (value.length < 8) {
                              return 'password_must_be_8_characters'.tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.0.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageRouteName.forgetPassword);
                          },
                          child: Text(
                            textAlign: TextAlign.end,
                            "forgot_password".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.accentColor,
                                  // decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 24.0.h,
                        ),
                        ElevatedBtn(
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              bloc.logIn(emailController.text,
                                  passwordController.text);
                            }
                          },
                          lable: "login".tr(),
                        ),
                        SizedBox(
                          height: 24.0.h,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PageRouteName.register);
                            },
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "don't_have_account".tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: AppColors.whiteColor,
                                        ),
                                  ),
                                  const TextSpan(text: " "),
                                  TextSpan(
                                    text: "create_account".tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: AppColors.accentColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28.0.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                indent: 25.w,
                                endIndent: 15.w,
                                thickness: 2.0.h,
                                color: AppColors.accentColor,
                              ),
                            ),
                            Text(
                              "or".tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Expanded(
                              child: Divider(
                                indent: 15.w,
                                endIndent: 25.w,
                                thickness: 2.0.h,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 28.0.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              bloc.signInWithGoogle();
                                if (state is OnSuccessLoginState){
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  PageRouteName.home,
                                  (_) => false,
                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const ImageIcon(
                                  AssetImage("assets/icons/google_icon.png"),
                                  color: AppColors.primaryColor,
                                ),
                                const SizedBox(width: 8.0),
                                Text("login_with_google".tr(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32.0.h,
                        ),
                        Column(
                          children: [
                            AnimatedToggleSwitch<bool>.dual(
                              current: context.locale.toString() == "en"
                                  ? positive
                                  : !positive,
                              first: false,
                              second: true,
                              spacing: 10.w,
                              style: ToggleStyle(
                                backgroundColor: Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                                borderColor: AppColors.accentColor,
                              ),
                              onChanged: (value) {
                                if (!value) {
                                  context.setLocale(const Locale("en"));
                                } else {
                                  context.setLocale(const Locale("ar"));
                                }
                                // setState(() => positive = value);
                              },
                              iconBuilder: (value) => value
                                  ? Image.asset(
                                      "assets/icons/ar_icon.png",
                                      fit: BoxFit.fill,
                                      width: 50.w,
                                    )
                                  : Image.asset(
                                      "assets/icons/en_icon.png",
                                      fit: BoxFit.fill,
                                      width: 50.w,
                                    ),
                            ),
                          ],
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
