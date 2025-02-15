import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_pojo/ui/layouts/home/tabs/explore%20tab/explore_tab.dart';
import 'package:movie_pojo/ui/layouts/home/tabs/home%20tab/home_tab.dart';
import 'package:movie_pojo/ui/layouts/home/tabs/profile%20tab/profile_tab.dart';
import 'package:movie_pojo/ui/layouts/home/tabs/search%20tab/search_tab.dart';
import 'package:movie_pojo/ui/widgets/nav_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    _currentIndex = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    resizeToAvoidBottomInset: false,
    extendBody:true,
      body: Stack(
        children: [
          // Main Content
          tabs[_currentIndex],
          // Floating Navigation Bar
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavItem(
                    icon: "home",
                    isActive: _currentIndex == 0,
                    onTap: () => setState(() => _currentIndex = 0),
                  ),
                  NavItem(
                    icon:'search',
                    isActive: _currentIndex == 1,
                    onTap: () => setState(() => _currentIndex = 1),
                  ),
                  NavItem(
                    icon: 'explore',
                    isActive: _currentIndex == 2,
                    onTap: () => setState(() => _currentIndex = 2),
                  ),
                  NavItem(
                    icon: 'profile',
                    isActive: _currentIndex == 3,
                    onTap: () => setState(() => _currentIndex = 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
     ExploreTab(),
    const ProfileTab()
  ];
}
