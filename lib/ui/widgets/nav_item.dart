import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String icon;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ImageIcon(
        AssetImage(
          'assets/icons/${icon}_icon.png',
        ),
        color: isActive
            ? Theme.of(context).cardColor
            : Theme.of(context).hintColor,
        size: 38,
      ),
    );
  }
}
