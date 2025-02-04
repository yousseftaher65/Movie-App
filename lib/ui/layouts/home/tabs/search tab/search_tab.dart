import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const ImageIcon(
                    AssetImage('assets/icons/search_icon.png'),
                  ),
                  hintText: 'search'.tr(),
                ),
              ),
             const Spacer(),
              Image.asset(
                'assets/images/empty.png',
                fit: BoxFit.cover,
              ),
             const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
