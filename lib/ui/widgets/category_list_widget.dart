import 'package:flutter/material.dart';
import 'package:movie_pojo/models/results.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';

class CategoryListWidget extends StatelessWidget {
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double aspectRatio;
  final int itemCount;
  final List<Results>? results;
  const CategoryListWidget(
      {super.key,
      this.results,
      required this.crossAxisCount,
      required this.mainAxisSpacing,
      required this.crossAxisSpacing,
      required this.itemCount,
      required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: itemCount,
        itemBuilder: (contxt, index) {
          return  MovieCard(
            results: results?[index],
            cardHeight: double.infinity,
            cardWidth: double.infinity,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          crossAxisCount: crossAxisCount,
          childAspectRatio: aspectRatio,
        ),
      ),
    );
  }
}
