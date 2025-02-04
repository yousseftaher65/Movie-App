import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Explore Tab',style: TextStyle(fontSize: 36 , color: Theme.of(context).cardColor),)
          ],
        ),
      ),
    );
  }
}