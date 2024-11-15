import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/features/finish_screen/finish_screen.dart';

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
                  ///test navigation. will be a change, where will be a currently Home Screen
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FinishScreen()));
                },
                child: const Text('test to LastScreen'))
          ],
        ),
      ),
    );
  }
}
