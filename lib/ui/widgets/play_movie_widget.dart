import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayMovieWidget extends StatelessWidget {
  const PlayMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Image.asset(
              'assets/images/movie_poster.jpg',
              height: 645.h,
              width: double.infinity.w,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 24.h),
              height: 645.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).primaryColor.withOpacity(0.8),
                    Theme.of(context).primaryColor,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 29,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          size: 29,
                          color: Theme.of(context).hintColor,
                          const AssetImage('assets/icons/save_icon.png'),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){},
                    child: Image.asset(
                      'assets/logos/play_logo.png',
                      height: 97.h,
                      width: 97.w,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Doctor Strange in the Multiverse of Madness",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "2022",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xffADADAD),
                        ),
                  ),
                ],
              ),
            ),
          ],
        );
  }
}