import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
   return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName ,{Object? arguments,required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil( routeName,predicate,arguments: arguments);
  }

  void pop() {
    Navigator.of(this).pop();
  }

   Future<dynamic> pushWidget(Widget widget) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
  }
   Future<dynamic> pushReplacementWidget(Widget widget) {
    return Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => widget));
  }
}