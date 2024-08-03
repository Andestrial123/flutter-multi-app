import 'package:flutter/material.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2e9e0),
      body: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: CustomBackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Positioned(top: 0,right: -24,
                  child: Image.asset('assets/images/tarelka-removebg-preview.png',height: 300,width: 300,fit: BoxFit.cover,)),
              Positioned(top: 160,left: 70,
                  child: Image.asset('assets/images/mint_leaf-removebg-preview.png',height: 64,width: 64,)),
              Positioned(top: 230,left: 140,child: Image.asset('assets/images/mint_leaf-removebg-preview.png',height: 50,width: 50,)),
              Positioned(top: 235,left: 80,child: Image.asset('assets/images/strawberry2-removebg-preview.png',height: 50,width: 50,)),
              Column(
                children: [
                  const Spacer(flex: 4),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit sed.',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: Text(
                        'Tempor incididunt ut labore et \ndolore magna aliqua consectetur \nadipiscing elit sed.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.brown,
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
                        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                        foregroundColor: const Color(0xFFf3e1d4),
                        backgroundColor: const Color(0xFFf3e1d4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Get Started',style: TextStyle(color: Color(0xFFaa9184),fontSize: 18),),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.brown;

    final path = Path();
    //Upper part of background
    paint.color = const Color(0xFF7c453e);
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.3,
        size.width * 0.55, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.95, size.height * 0.2, size.width, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    //Bottom part of background
    path.moveTo(size.width, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.85, size.height * 0.7,
        size.width * 0.45, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.05, size.height * 0.8, 0, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
