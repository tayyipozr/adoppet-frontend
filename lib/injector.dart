import 'package:animal/navigation_routes.dart';
import 'package:animal/network/apis/adopt_api.dart';
import 'package:animal/network/apis/auth_api.dart';
import 'package:animal/network/apis/blockchain_api.dart';
import 'package:animal/network/apis/notification_api.dart';
import 'package:animal/network/apis/pet_api.dart';
import 'package:animal/network/apis/user_api.dart';
import 'package:animal/network/base_api.dart';
import 'package:animal/repository/abstracts/pet_repository_interface.dart';
import 'package:animal/repository/adopt_repository.dart';
import 'package:animal/repository/auth_repository.dart';
import 'package:animal/repository/base_repository.dart';
import 'package:animal/repository/blockchain_repository.dart';
import 'package:animal/repository/notification_repository.dart';
import 'package:animal/repository/pet_repository.dart';
import 'package:animal/repository/user_repository.dart';
import 'package:animal/services/push_notification_service.dart';
import 'package:animal/services/push_notification_service_abstract.dart';
import 'package:animal/stores/adopt_store.dart';
import 'package:animal/stores/auth_store.dart';
import 'package:animal/stores/blockchain_store.dart';
import 'package:animal/stores/core_store.dart';
import 'package:animal/stores/notification_store.dart';
import 'package:animal/stores/pet_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:animal/stores/user_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  Loggy.initLoggy(
    logPrinter: (kReleaseMode) ? PrettyPrinter() : PrettyPrinter(showColors: true),
    logOptions: (kReleaseMode) ? LogOptions(LogLevel.error) : LogOptions(LogLevel.all),
  );

  serviceLocator.registerLazySingleton(() => Loggy('AdoppetLogger'));

  serviceLocator.registerLazySingleton(() => NavigationRoute());

  // Outer
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // Apis
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => BaseApi());
  serviceLocator.registerLazySingleton(() => AuthApi());
  serviceLocator.registerLazySingleton(() => UserApi());
  serviceLocator.registerLazySingleton(() => PetApi());
  serviceLocator.registerLazySingleton(() => NotificationApi());
  serviceLocator.registerLazySingleton(() => AdoptApi());
  serviceLocator.registerLazySingleton(() => BlockchainApi());

  // Services
  serviceLocator.registerLazySingleton(() => PushNotificationService());

  // Repositories
  serviceLocator.registerLazySingleton<BaseRepository>(() => BaseRepository());
  serviceLocator.registerLazySingleton(() => AuthRepository(serviceLocator()));
  serviceLocator.registerLazySingleton<IPetRepository>(() => PetRepository(
        sharedPreferences: serviceLocator(),
        petApi: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton(() => UserRepository(serviceLocator()));
  serviceLocator.registerLazySingleton(() => NotificationRepository(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AdoptRepository(serviceLocator()));
  serviceLocator.registerLazySingleton(() => BlockchainRepository(serviceLocator()));

  // Stores
  serviceLocator.registerFactory(() => CoreStore());
  serviceLocator.registerFactory(() => AuthStore(serviceLocator()));
  serviceLocator.registerFactory(() => PetStore(serviceLocator(), serviceLocator()));
  serviceLocator.registerFactory(() => UserStore(serviceLocator()));
  serviceLocator.registerFactory(() => NotificationStore(serviceLocator()));
  serviceLocator.registerFactory(() => AdoptStore(serviceLocator()));
  serviceLocator.registerFactory(() => BlockchainStore(serviceLocator()));

  serviceLocator.registerSingleton<RootStore>(
    RootStore(
      authStore: serviceLocator(),
      coreStore: serviceLocator(),
      userStore: serviceLocator(),
      petStore: serviceLocator(),
      notificationStore: serviceLocator(),
      adoptStore: serviceLocator(),
      blockchainStore: serviceLocator(),
    ),
  );

  // Other
  serviceLocator.registerLazySingleton<IPushNotificationService>(() => PushNotificationService());
}
