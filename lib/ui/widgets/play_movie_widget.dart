// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/models/movie_details_response.dart';

class PlayMovieWidget extends StatefulWidget {
  final MovieDetailsResponse? data;
  final Function onTap;
 bool isfav;
   PlayMovieWidget(
      {super.key, required this.onTap, this.data, this.isfav = false});

  @override
  State<PlayMovieWidget> createState() => _PlayMovieWidgetState();
}


class _PlayMovieWidgetState extends State<PlayMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              "https://image.tmdb.org/t/p/original/${widget.data?.backdropPath}",
          height: 645.h,
          width: double.infinity.w,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).cardColor,
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
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
                    onPressed: () {
                      widget.onTap();
                      setState(() {
                        widget.isfav = !widget.isfav;
                      });
                    },
                    icon: ImageIcon(
                      size: 29,
                      color: Theme.of(context).hintColor,
                      AssetImage(
                        widget.isfav 
                          ? 'assets/icons/save_icon.png'
                          : 'assets/icons/un_saved_icon.png'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/logos/play_logo.png',
                  height: 97.h,
                  width: 97.w,
                ),
              ),
              const Spacer(),
              Text(
                widget.data?.title ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                (widget.data?.releaseDate?.isNotEmpty ?? false)
                    ? widget.data?.releaseDate?.substring(0, 4) ?? ''
                    : '',
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
