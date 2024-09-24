import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BakeryItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  const BakeryItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 130.w,
                  height: 100.0.h, // Responsive height
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ), // Responsive spacing
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.0.sp, // Responsive font size
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0.h), // Responsive spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18.0.sp, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.0.r, // Responsive radius
                      backgroundColor: Colors.brown,
                      child: IconButton(
                        icon: Icon(Icons.add, color: Colors.white, size: 16.0.sp), // Responsive icon size
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
