import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/features/bottom_nav/widgets/custom_bottom_nav_widget.dart';
import 'package:flutter_multi_app/utils/app_route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil();

    return AutoTabsScaffold(
      backgroundColor: const Color(0xFFf2e9e0),
      routes: const [HomeView(), LocationView(), OrderView(), MainRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return ClipRRect(
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
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.location_pin),
                      label: "Location",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.fact_check_outlined),
                      label: "Order",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined),
                      label: "Profile",
                    ),
                  ],
                  iconSize: 32,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                )));
      },
    );
  }
}
