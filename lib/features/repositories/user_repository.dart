import 'package:architecture_task/features/data/data_sources/user_remote_data_source.dart';
import 'package:architecture_task/features/domain/entities/employee_model.dart';
import 'package:architecture_task/features/domain/repositories/domain_user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:architecture_task/core/errors/app_error.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<AppError, List<Employee>>> getUserData() async {
    try {
      final employees = await userRemoteDataSource.getEmployees();
      return Right(employees);
    } catch (e) {
      return Left(AppError("Failed to fetch employees"));
    }
  }
}
