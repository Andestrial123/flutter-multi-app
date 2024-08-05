import 'package:flutter/material.dart';
import 'package:flutter_multi_app/utils/custom_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFf2e9e0),
      body: CustomPaint(
        size: Size(screenWidth, screenHeight),
        painter: CustomBackgroundPainter(),
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * -0.05,
              right: screenHeight * 0,
              child: SizedBox(
                height: screenHeight * 0.5,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/images/tarelka-removebg-preview.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.2,
              left: screenWidth * 0.13,
              child: Image.asset(
                'assets/images/mint_leaf-removebg-preview.png',
                height: screenHeight * 0.08,
                width: screenWidth * 0.15,
              ),
            ),
            Positioned(
              top: screenHeight * 0.32,
              left: screenWidth * 0.35,
              child: Image.asset(
                'assets/images/mint_leaf-removebg-preview.png',
                height: screenHeight * 0.07,
                width: screenWidth * 0.13,
              ),
            ),
            Positioned(
              top: screenHeight * 0.32,
              left: screenWidth * 0.13,
              child: Image.asset(
                'assets/images/strawberry2-removebg-preview.png',
                height: screenHeight * 0.07,
                width: screenWidth * 0.13,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                children: [
                  const Spacer(flex: 4),
                   Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit sed.',
                        style:  TextStyle(
                            color: Colors.brown,
                            fontSize: ScreenUtil().setSp(16),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                   Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Tempor incididunt ut labore et \ndolore magna aliqua consectetur \nadipiscing elit sed.',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                        foregroundColor: const Color(0xFFf3e1d4),
                        backgroundColor: const Color(0xFFf3e1d4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.brown,fontWeight: FontWeight.w400,fontSize:ScreenUtil().setSp(16)),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
