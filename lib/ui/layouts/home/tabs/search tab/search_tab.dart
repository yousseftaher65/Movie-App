import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text(
              'Search Tab',
              style: TextStyle(fontSize: 36, color: Theme.of(context).cardColor),
            )
          ],
        ),
      ),
    );
  }
}