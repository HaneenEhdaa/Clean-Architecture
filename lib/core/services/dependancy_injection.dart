import 'package:architecture_task/features/data/data_sources/user_remote_data_source.dart';
import 'package:architecture_task/features/domain/repositories/domain_user_repository.dart';
import 'package:architecture_task/features/domain/usecase/get_user.dart';
import 'package:architecture_task/features/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

void initDependencies() {
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(dio: sl()));

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: sl()));

  sl.registerLazySingleton(() => GetUserUseCase(userRepository: sl()));
}



