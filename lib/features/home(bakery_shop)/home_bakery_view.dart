import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBakeryView extends StatefulWidget {
  const HomeBakeryView({super.key});

  @override
  State<HomeBakeryView> createState() => _HomeBakeryViewState();
}

class _HomeBakeryViewState extends State<HomeBakeryView> {
  final screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2e9e0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment:CrossAxisAlignment.center,children: [
            const Text('AppBar'),
            SizedBox(height: screenUtil.setHeight(16)),
            const Text('SearchBar'),
            SizedBox(height: screenUtil.setHeight(16)),
            const Text('Daily Discount'),
            SizedBox(height: screenUtil.setHeight(16)),
            const Text('Categories Chips'),
            SizedBox(height: screenUtil.setHeight(16)),
            const Text('Bakery products'),
          ]),
        ),
      ),
    );
  }
}
