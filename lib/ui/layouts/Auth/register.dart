import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_pojo/core/cubit/register_maneger/register_cubit.dart';
import 'package:movie_pojo/core/cubit/register_maneger/register_states.dart';
import '../../../core/routes/page_route_name.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/base_theme.dart';
import '../../widgets/auth.btn.dart';
import '../../widgets/elevated_btn.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final rePasswordController = TextEditingController();

  final phoneNumberController = TextEditingController();
  int image = 0;
  bool _isObscured = true;
  bool _isObscuredRePassword = true;
  bool positive = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'.tr()),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is OnErrorRegisterState) {
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
            } else if (state is OnLoadingRegisterState) {
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
            } else if (state is OnSuccessRegisterState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                PageRouteName.logIn,
                (_) => false,
              );
              Fluttertoast.showToast(
                msg: "account_created".tr(),
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
            var bloc = BlocProvider.of<RegisterCubit>(context);
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
                      children: [
                        SizedBox(
                          height: 150.h,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 16.w),
                              itemCount: 9,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      image = index;
                                    });
                                    print(index);
                                  },
                                  child: Image(
                                    fit: BoxFit.contain,
                                    width: image == index ? 200.w : 100.w,
                                    height: image == index ? 150.h : 100.h,
                                    image: AssetImage(
                                        "assets/images/avater_${index + 1}.png"),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        //Name Btn
                        AuthBtn(
                          show: false,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                            child: const ImageIcon(
                              AssetImage(
                                "assets/icons/name_icon.png",
                              ),
                            ),
                          ),
                          tittle: "name".tr(),
                          textEditingController: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please_enter_name'.tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 24.h,
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
                        //Password Btn
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
                          height: 24.h,
                        ),
                        //Re-Password Btn
                        AuthBtn(
                          show: _isObscuredRePassword,
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
                              _isObscuredRePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscuredRePassword = !_isObscuredRePassword;
                              });
                            },
                          ),
                          tittle: "rePassword".tr(),
                          textEditingController: rePasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'must_reenter_password'.tr();
                            }
                            if (value.length < 8) {
                              return 'password_must_be_8_characters'.tr();
                            }
                            if (passwordController.text != value) {
                              return 'passwords_do_not_match'.tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        //Phone Number Btn
                        AuthBtn(
                          show: false,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                            child: const ImageIcon(
                              AssetImage(
                                "assets/icons/phone_icon.png",
                              ),
                            ),
                          ),
                          tittle: "phone_number".tr(),
                          textEditingController: phoneNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter_phone_number'.tr();
                            }
                            final phoneRegex =
                                RegExp(r'^(?:\+20|0)?1[0-2,5]{1}[0-9]{8}$');
                            if (!phoneRegex.hasMatch(value)) {
                              return 'please_enter_a_valid_phone_number'.tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 24.0.h,
                        ),
                        //Login Button
                        ElevatedBtn(
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              bloc.register(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                                phoneNumberController.text,
                                image,
                              );
                            }
                          },
                          lable: "create_account".tr(),
                        ),
                        //
                        SizedBox(
                          height: 24.0.h,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, PageRouteName.logIn);
                            },
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "already_have_account".tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: AppColors.whiteColor,
                                        ),
                                  ),
                                  const TextSpan(text: " "),
                                  TextSpan(
                                    text: "login".tr(),
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
