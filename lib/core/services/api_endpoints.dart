class ApiEndpoints {
  static const String baseUrl = 'https://nafsia.up.railway.app/api/v1/';
  static const String signUp = 'auth/register';
  static const String logIn = 'auth/login';
  static const String logout = 'auth/logout';
  static const String forgetPassword = 'auth/forgot-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resetPassword = 'auth/reset-password';
  static const String getAllPosts = 'post';
  static const String reactPost = 'react';
  static const String getPostReactions = 'react';
  static const String savePost = 'saved-posts';
  static const String getSavedPosts = 'saved-posts';
  static const String removePostFromSavedPosts = 'saved-posts';
  static const String getUserData = 'user';
  static const String updateUserProfile = 'user';
  static const String changeUserPassword = 'user';
  static const String getAllDoctors = 'user/all';
  static const String getDoctorAppointments = 'appointment';
  static const String bookPrivateSessionAppointment = 'session/private-session';
  static const String searchDoctors = 'user/search';
  static const String getDoctorReviews = 'review';
  static const String getCommunitySessions = 'session';
   static const String getPrivateSessions = 'session';
  static const String participateInCommunitySession = 'session/community-session/';
  static const String getCommunitySessionMessages = 'message/';
}
