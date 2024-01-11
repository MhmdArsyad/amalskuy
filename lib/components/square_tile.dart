import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final double height;
  final Function()? onTap;

  const SquareTile({
    super.key,
    required this.imagePath,
    required this.height,
    required this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow:[
            BoxShadow(
              blurRadius: 40,
              spreadRadius: 0.1,
              offset: Offset(0.1,0.1),
              color: Colors.grey.withOpacity(0.4),
            )
          ]
        ),
        child: Image.asset(
          imagePath,
          height: height,
        ),
      ),
    );
  }
}
