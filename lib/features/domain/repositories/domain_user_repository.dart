import 'package:architecture_task/features/domain/entities/employee_model.dart';
import 'package:dartz/dartz.dart';
import 'package:architecture_task/core/errors/app_error.dart';

abstract class UserRepository {
  Future<Either<AppError, List<Employee>>> getUserData();
}
