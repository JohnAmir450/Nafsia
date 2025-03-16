import 'dart:convert';

import 'package:nafsia/core/helper_functions/cache_helper.dart';
import 'package:nafsia/core/models/user_model.dart';
import 'package:nafsia/core/utils/chache_helper_keys.dart';



UserModel getUserData() {
  var userEntity = UserModel.fromJson(
      jsonDecode(CacheHelper.getData(key: kSaveUserDataKey)));
  return userEntity;
}


