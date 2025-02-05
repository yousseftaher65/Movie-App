import 'package:flutter/material.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';

class CategoryListWidget extends StatelessWidget {
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double aspectRatio;
  const CategoryListWidget(
      {super.key,
      required this.crossAxisCount,
      required this.mainAxisSpacing,
      required this.crossAxisSpacing,
      required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 20,
        itemBuilder: (contxt, index) {
          return const MovieCard(
            cardHeight: double.infinity,
            cardWidth:  double.infinity,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          crossAxisCount: crossAxisCount,
          childAspectRatio: aspectRatio,
          // maxCrossAxisExtent: maxCrossAxisExtent, // Max width of each item
          //childAspectRatio: aspectRatio, // Width/Height ratio
        ),
      ),
    );
  }
}
