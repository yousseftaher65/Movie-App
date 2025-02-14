import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_pojo/core/constants/bloc_observer.dart';
import 'package:movie_pojo/core/routes/app_routes.dart';
import 'package:movie_pojo/core/theme/base_theme.dart';

void main() async {
   Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
     EasyLocalization(
    supportedLocales: const [Locale('en'),Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        BaseTheme theme = BaseTheme();
        return GlobalLoaderOverlay(
          overlayColor: Colors.transparent.withOpacity(.7),
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: theme.themeData ,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          ),
        );
      },
    );
  }
}
