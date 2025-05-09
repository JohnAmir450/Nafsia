import 'package:flutter/material.dart';
import 'package:nafsia/core/helper_functions/rouutes.dart';
import 'package:nafsia/features/auth/presentation/views/Verify_otp_view.dart';
import 'package:nafsia/features/auth/presentation/views/forget_password_view.dart';
import 'package:nafsia/features/auth/presentation/views/login_view.dart';
import 'package:nafsia/features/auth/presentation/views/reset_password_view.dart';
import 'package:nafsia/features/auth/presentation/views/sign_up_view.dart';
import 'package:nafsia/features/home/domain/models/sessions_model.dart';
import 'package:nafsia/features/home/domain/models/doctor_model.dart';
import 'package:nafsia/features/home/presentation/views/change_password_view.dart';
import 'package:nafsia/features/home/presentation/views/chats_view.dart';
import 'package:nafsia/features/home/presentation/views/community_session_chat_view.dart';
import 'package:nafsia/features/home/presentation/views/doctor_profile_view.dart';
import 'package:nafsia/features/home/presentation/views/doctors_view.dart';
import 'package:nafsia/features/home/presentation/views/main_view.dart';
import 'package:nafsia/features/home/presentation/views/mode_selection_view.dart';
import 'package:nafsia/features/home/presentation/views/my_private_sessions.dart';
import 'package:nafsia/features/home/presentation/views/saved_posts_view.dart';
import 'package:nafsia/features/home/presentation/views/user_profile_view.dart';

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
    case Routes.userProfileView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const UserProfileView(),
          type: PageTransitionType.fade);
    case Routes.savedPostsView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const SavedPostsView(),
          type: PageTransitionType.fade);
    case Routes.changePasswordView:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const ChangePasswordView(),
          type: PageTransitionType.fade);

    case Routes.doctorProfileView:
      var doctor = settings.arguments as DoctorModel;
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: DoctorProfileView(
            doctor: doctor,
          ),
          type: PageTransitionType.fade);
    case Routes.communitySessionChatView:
      var communitySessionsModel = settings.arguments as SessionsModel;
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: CommunitySessionChatView(
              communitySessionsModel: communitySessionsModel),
          type: PageTransitionType.fade);

    case Routes.myPrivateSessions:
      return PageTransition(
          duration: const Duration(milliseconds: 50),
          child: const MyPrivateSessionsView(),
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
