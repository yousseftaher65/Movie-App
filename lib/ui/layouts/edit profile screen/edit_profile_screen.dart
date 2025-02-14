import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/widgets/avater_dialog_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int currentIndex = 0;
  void _updateAvatarIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
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
                        });
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
              TextField(
                autocorrect: true,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'name'.tr(),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).focusColor),
                child: Text(
                  'delete_account'.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'update_data'.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
  }
}