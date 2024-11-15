import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/features/bottom_nav/widgets/custom_bottom_nav_widget.dart';
import 'package:flutter_multi_app/shared/translation/locale_keys.dart';
import 'package:flutter_multi_app/routing/app_route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil();
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        LocationRoute(),
        OrderRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(
            itemSpacing: screenUtil.setWidth(20),
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
          body: ClipRRect(
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
                  child: child)),
        );
      },
    );
  }
}
