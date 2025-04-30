import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/features/auth/presentation/views/Verify_otp_view.dart';
import 'package:nafsia/features/auth/presentation/views/forget_password_view.dart';
import 'package:nafsia/features/auth/presentation/views/login_view.dart';
import 'package:nafsia/features/auth/presentation/views/reset_password_view.dart';
import 'package:nafsia/features/auth/presentation/views/sign_up_view.dart';
import 'package:nafsia/features/home/presentation/views/chats_view.dart';
import 'package:nafsia/features/home/presentation/views/doctors_view.dart';
import 'package:nafsia/features/home/presentation/views/main_view.dart';
import 'package:nafsia/features/home/presentation/views/mode_selection_view.dart';

import 'package:page_transition/page_transition.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const LoginView(),
          type: PageTransitionType.fade);

    case Routes.forgetPasswordView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const ForgetPasswordView(),
          type: PageTransitionType.fade);

    case Routes.verifyOtpView:
      var email = settings.arguments as String;
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: VerifyOtpView(
            email: email,
          ),
          type: PageTransitionType.fade);

    case Routes.resetPasswordView:
      var otp = settings.arguments as String;
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: ResetPasswordView(
            otp: otp,
          ),
          type: PageTransitionType.fade);

    case Routes.signUpView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const SignUpView(),
          type: PageTransitionType.fade);

    case Routes.mainView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const MainView(),
          type: PageTransitionType.fade);

    case Routes.modeSelectionView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const MoodSelectionScreen(),
          type: PageTransitionType.fade);

    case Routes.chatsView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const ChatsView(),
          type: PageTransitionType.fade);

    case Routes.doctorsView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const DoctorsView(),
          type: PageTransitionType.fade);
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
