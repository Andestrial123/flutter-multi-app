import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/routing/app_route.gr.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.pushRoute(const FinishRoute());
                },
                child: const Text('test to LastScreen'))
          ],
        ),
      ),
    );
  }
}
