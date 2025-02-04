import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Profile Tab',
              style: TextStyle(fontSize: 36, color: Theme.of(context).cardColor),
            )
          ],
        ),
      ),
    );
  }
}