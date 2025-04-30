import 'dart:convert';
import 'package:nafsia/core/helper_functions/cache_helper.dart';
import 'package:nafsia/core/utils/chache_helper_keys.dart';
import 'package:nafsia/features/auth/logic/repos/models/user_model.dart';



UserModel getUserData() {
  final cachedData = CacheHelper.getData(key: kSaveUserDataKey);
  
  // Handle case when there is no data in cache
  if (cachedData == null) {
    throw Exception("No user data found in cache");
  }

  try {
    // Return the user data by decoding it into the correct model
    return UserModel.fromJson(jsonDecode(cachedData));
  } catch (e) {
    throw Exception("Failed to decode cached user data: $e");
  }
}




