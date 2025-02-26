import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/models/cast_response.dart';

class CastContainer extends StatelessWidget {
  final Cast? data;
  const CastContainer({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 92.h,
      width: double.infinity.w,
      padding:  EdgeInsets.symmetric(horizontal:  11.w , vertical: 11.h),
      decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
             imageUrl:  'https://image.tmdb.org/t/p/original/${data?.profilePath}',
              height: 70.h,
              width: 70.w,
              fit: BoxFit.cover,
              placeholder: (context, url) =>  Center(child: CircularProgressIndicator(
                color: Theme.of(context).cardColor,
              ),),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error),),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : ${data?.name ?? ''} ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).hintColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400),
                  
                  softWrap: true,
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  'Character : ${data?.character ?? ''}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
