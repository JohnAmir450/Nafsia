import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafsia/core/helper_functions/is_device_in_portrait.dart';

class CustomBottomNavigationBarDecoration extends StatelessWidget {
  final Widget child;
  const CustomBottomNavigationBarDecoration({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isDeviceInPortrait(context) ? 70.h : 120.h,
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              offset: Offset(0, -2),
              blurRadius: 25,
              spreadRadius: 0,
            )
          ]),
      child: child,
    );
  }
}
