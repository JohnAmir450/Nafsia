
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nafsia/core/services/api_consumer.dart';
import 'package:nafsia/core/services/dio_consumer.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo.dart';
import 'package:nafsia/features/auth/logic/repos/auth_repo_implementation.dart';

final getIt = GetIt.instance;

void setupGetIt() {
   // Register Dio instance
  getIt.registerSingleton<Dio>(Dio());

  // Register ApiConsumer implementation
  getIt.registerSingleton<ApiConsumer>(DioConsumer(dio: getIt<Dio>()));

  // Register AuthRepo
  getIt.registerSingleton<AuthRepo>(AuthRepoImplementation(getIt<ApiConsumer>()));
 
}
