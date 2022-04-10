import 'package:animal/navigation_routes.dart';
import 'package:animal/repository/abstracts/pet_repository_interface.dart';
import 'package:animal/repository/pet_repository.dart';
import 'package:animal/repository/user_repository.dart';
import 'package:animal/stores/auth_store.dart';
import 'package:animal/stores/core_store.dart';
import 'package:animal/stores/pet_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton(() => NavigationRoute());

// Outer
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

// Apis

// Repositories
  serviceLocator.registerLazySingleton<IPetRepository>(() => PetRepository(sharedPreferences: serviceLocator()));
  serviceLocator.registerLazySingleton(() => UserRepository(sharedPreferences: serviceLocator()));

// Stores

  serviceLocator.registerFactory(() => CoreStore());
  serviceLocator.registerFactory(() => AuthStore(serviceLocator()));
  serviceLocator.registerFactory(() => PetStore(serviceLocator(), serviceLocator()));
  serviceLocator.registerSingleton<RootStore>(
    RootStore(
      authStore: serviceLocator(),
      coreStore: serviceLocator(),
      petStore: serviceLocator(),
    ),
  );
}
