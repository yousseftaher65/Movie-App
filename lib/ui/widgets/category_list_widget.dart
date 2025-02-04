import 'package:flutter/material.dart';
import 'package:movie_pojo/ui/widgets/movie_card.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 20,
        itemBuilder: (contxt, index) {
          return const MovieCard();
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 20,
            childAspectRatio: 19.5 / 31),
      ),
    );
  }
}
