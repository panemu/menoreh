import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

import 'presentation/routers/auth_guard.dart';

/// Injection instance e.g, `sl<FlavorConfig>().name;`
final sl = GetIt.instance;

Future<void> initLocator(FlavorConfig flavor) async {
  sl.allowReassignment = true;

  //! External
  _external(flavor);
  //! Bloc / Cubit
  _bloc();
  //! Usecase
  _useCase();
  //! Repository
  _repository();
  //! DataSource
  _dataSource();
}

void _external(FlavorConfig flavor) {
  // Flavor
  sl.registerSingleton<FlavorConfig>(flavor);
  // Base Api
  sl.registerSingleton(BaseApi(flavor));
  // Auth route
  sl.registerFactory<AuthGuard>(() => AuthGuard(sl()));
}

void _bloc() {
  // Login
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  sl.registerFactory<CheckLoginCubit>(() => CheckLoginCubit(sl()));
  sl.registerFactory<UserInfoCubit>(() => UserInfoCubit(sl()));
  // Logout
  sl.registerFactory<LogoutCubit>(() => LogoutCubit(sl()));
  // Country
  sl.registerFactory<CountryCubit>(() => CountryCubit(sl()));
  sl.registerFactory<CountryByIdCubit>(() => CountryByIdCubit(sl()));
  sl.registerFactory<CountryPostCubit>(() => CountryPostCubit(sl()));
  sl.registerFactory<CountryPutCubit>(() => CountryPutCubit(sl()));
  sl.registerFactory<CountryDeleteCubit>(() => CountryDeleteCubit(sl()));
}

void _useCase() {
  // Login
  sl.registerLazySingleton(() => AuthCheck(sl()));
  sl.registerLazySingleton(() => AuthGetUser(sl()));
  sl.registerLazySingleton(() => AuthLogout(sl()));
  sl.registerLazySingleton(() => AuthPostLogin(sl()));
  sl.registerLazySingleton(() => AuthPostRegister(sl()));
  // Country
  sl.registerLazySingleton(() => CountryGetData(sl()));
  sl.registerLazySingleton(() => CountryGetByIdData(sl()));
  sl.registerLazySingleton(() => CountryPost(sl()));
  sl.registerLazySingleton(() => CountryPut(sl()));
  sl.registerLazySingleton(() => CountryDelete(sl()));
}

void _repository() {
  // Login
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDatasource: sl(), localDatasource: sl()),
  );
  // Country
  sl.registerLazySingleton<CountryRepository>(() => CountryRepositoryImpl(sl()));
}

void _dataSource() {
  // Login
  sl.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<AuthLocalDatasource>(() => AuthLocalDatasourceImpl());
  // Country
  sl.registerLazySingleton<CountryRemoteDatasource>(() => CountryRemoteDatasourceImpl(sl()));
}
