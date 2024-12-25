import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hire_harmony/utils/app_colors.dart';
import 'package:hire_harmony/views/pages/cus_home_page.dart';
import 'package:hire_harmony/views/pages/favorites_page.dart';
import 'package:hire_harmony/views/pages/profile_page.dart';

class AdnNavbar extends StatefulWidget {
  const AdnNavbar({super.key});

  @override
  State<AdnNavbar> createState() => _AdnNavbarState();
}

class _AdnNavbarState extends State<AdnNavbar> {
  Widget? _child;
  @override
  void initState() {
    _child = const CusHomePage();
    super.initState(); // Initialize controller
  }

  // List<PersistentTabConfig> _navBarsItems() {
  //   return [

  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    // final user = AuthCubit();
    // final myuser = user.getCurrentUser();
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: _child,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
            icon: Icons.message_outlined,
            backgroundColor:
                AppColors.transparent, // Transparent when not selected
            selectedForegroundColor:
                AppColors.navy, // Set to teal when selected
            unselectedForegroundColor:
                AppColors.white, // White when not selected
            extras: {"label": "Messages"},
          ),
          FluidNavBarIcon(
            icon: Icons.home_repair_service_outlined,
            backgroundColor: Colors.transparent,
            selectedForegroundColor: AppColors.navy,
            unselectedForegroundColor: AppColors.white,
            extras: {"label": "Home"},
          ),
          FluidNavBarIcon(
            icon: Icons.person_2_outlined,
            backgroundColor: Colors.transparent,
            selectedForegroundColor: AppColors.navy,
            unselectedForegroundColor: AppColors.white,
            extras: {"label": "Profile"},
          ),
        ],
        onChange: _handleNavigationChange,
        style: FluidNavBarStyle(
          barBackgroundColor: AppColors.orange
              , // Main background color of the bar
          iconBackgroundColor:
              AppColors.orange, // Set selected icon background to teal
        ),
        scaleFactor: 1.5,
        defaultIndex: 1,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const CusHomePage();
          break;
        case 1:
          _child = const FavoritesPage();
          break;
        case 2:
          _child = const ProfilePage();
          break;
      }
      _child = AnimatedSwitcher(
        // switchInCurve: Curves.easeInCirc,
        // switchOutCurve: Curves.elasticOut,
        duration: const Duration(milliseconds: 200),
        child: _child,
      );
    });
  }
}
