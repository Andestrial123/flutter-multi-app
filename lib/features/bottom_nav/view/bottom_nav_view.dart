import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/features/bottom_nav/widgets/custom_bottom_nav_widget.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/utils/app_route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> with SingleTickerProviderStateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void toggleBottomNavVisibility(bool isVisible) {
    if (isVisible) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil();
    return AutoTabsScaffold(
      key: _navigatorKey,
      extendBody: true,
      backgroundColor: const Color(0xFFf2e9e0),
      routes: [
        const HomeRoute(),
        GoogleMapsRoute(onToggleBottomNav: toggleBottomNavVisibility),
        const OrderRoute(),
        const ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 1)).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: CustomBottomNavigationBar(
                  itemSpacing: screenUtil.setWidth(30),
                  paddingHorizontal: screenUtil.setWidth(24),
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home),
                      label: LocaleKeys.home.tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.location_pin),
                      label: LocaleKeys.location.tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.fact_check_outlined),
                      label: LocaleKeys.order.tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.account_circle_outlined),
                      label: LocaleKeys.profile.tr(),
                    ),
                  ],
                  iconSize: 32,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
