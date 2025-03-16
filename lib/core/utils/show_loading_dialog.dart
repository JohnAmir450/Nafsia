 import 'package:flutter/material.dart';
import 'package:nafsia/core/widgets/custom_animated_loading_widget.dart';

Future<dynamic> showLoadingDialog(BuildContext context) {
    return showDialog(context: context, builder:(context)=> const CustomAnimatedLoadingWidget());
  }


