import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/core/services/firebase_auth_service.dart';
import 'package:nafsia/features/auth/presentation/views/login_view.dart';
import 'package:nafsia/features/auth/presentation/views/sign_up_view.dart';

import 'package:page_transition/page_transition.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginView:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case Routes.signUpView:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    default:
     // var isLoggedIn = FirebaseAuthService().isLoggedIn();
      return PageTransition(
        duration: const Duration(milliseconds: 50),
        child: Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
        type: PageTransitionType.fade,
      );
  }
}
