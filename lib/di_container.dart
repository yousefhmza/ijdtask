import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ijdtask/modules/home/cubits/home_cubit.dart';
import 'package:ijdtask/modules/home/repositories/home_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'core/services/local/cache_client.dart';
import 'core/services/network/api_client.dart';
import 'core/services/network/network_info.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // external
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));

  // core
  sl.registerLazySingleton<CacheClient>(() => CacheClient(sl<SharedPreferences>(), sl<FlutterSecureStorage>()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>()));
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl<Dio>(), sl<CacheClient>(), sl<PrettyDioLogger>()));

  // Repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepository(sl<ApiClient>(), sl<NetworkInfo>()));

  // View models
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl<HomeRepository>()));
}
