import 'package:ascension_mobile_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/presentation/widgets/bottom_navigation_bar/custom_nav_bar_icon.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/icons/ep.dart';
import 'package:iconify_flutter/icons/teenyicons.dart';

class BottomNavBar extends StatelessWidget {
  final TabsRouter tabsRouter;
  final bool isSeller;
  const BottomNavBar({
    required this.tabsRouter,
    required this.isSeller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hideBottomNav = context.topRouteMatch.meta.containsKey('hideBottomNav') && context.topRouteMatch.meta['hideBottomNav'] == true;
    return Offstage(
      offstage: hideBottomNav,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: Styles.elevation1,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              if (!isSeller)
                const BottomNavigationBarItem(
                  icon: CustomBottomNavBarIcon(iconName: Teenyicons.home_alt_outline),
                  activeIcon: CustomBottomNavBarIcon(iconName: Teenyicons.home_alt_outline, isActive: true),
                  backgroundColor: Colors.blue,
                  label: 'Home',
                ),
              BlocProvider.of<AuthBloc>(context).state.user.userType == UserType.seller
                  ? const BottomNavigationBarItem(
                      icon: CustomBottomNavBarIcon(iconName: Ep.suitcase),
                      activeIcon: CustomBottomNavBarIcon(iconName: Ep.suitcase, isActive: true),
                      backgroundColor: Colors.blue,
                      label: 'Businesses',
                    )
                  : const BottomNavigationBarItem(
                      icon: CustomBottomNavBarIcon(iconName: Ep.search),
                      activeIcon: CustomBottomNavBarIcon(iconName: Ep.search, isActive: true),
                      backgroundColor: Colors.blue,
                      label: 'Search',
                    ),
              const BottomNavigationBarItem(
                icon: CustomBottomNavBarIcon(iconName: Teenyicons.chat_typing_outline),
                activeIcon: CustomBottomNavBarIcon(iconName: Teenyicons.chat_typing_outline, isActive: true),
                backgroundColor: Colors.blue,
                label: 'Messages',
              ),
              const BottomNavigationBarItem(
                icon: CustomBottomNavBarIcon(iconName: Teenyicons.user_circle_outline),
                activeIcon: CustomBottomNavBarIcon(iconName: Teenyicons.user_circle_outline, isActive: true),
                backgroundColor: Colors.blue,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
