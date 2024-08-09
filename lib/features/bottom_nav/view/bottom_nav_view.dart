import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/utils/app_route.gr.dart';

@RoutePage()
class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: const Color(0xFFf2e9e0),
      routes: const [HomeView(), LocationView(), OrderView(), ProfileView()],
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
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  elevation: 15,
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
                  showUnselectedLabels: true,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                )));
      },
    );
  }
}
