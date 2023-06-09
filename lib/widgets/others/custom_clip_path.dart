import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
 


  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..arcToPoint(
        Offset(size.width, 0),
        clockwise: false,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 0);

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipPath oldClipper) => true;
}
