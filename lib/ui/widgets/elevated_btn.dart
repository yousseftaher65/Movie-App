import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  final Function() onPress;
  final String lable;
  final ButtonStyle? theme;

  const ElevatedBtn({
    super.key,
    required this.lable,
    required this.onPress,
    this.theme
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          lable,
          style: Theme.of(context).textTheme.titleMedium
        ),
      ),
    );
  }
}
