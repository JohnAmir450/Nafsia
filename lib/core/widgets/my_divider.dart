import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDivider extends StatelessWidget {
  final double? indent;
  final double? endIndent;
  final double? thickness;
  const MyDivider({
    super.key, this.indent, this.endIndent, this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(thickness:thickness?? 1.5, color: Colors.grey[300],endIndent:endIndent ?? 20,indent:indent?? 20,);
  }
}