import 'package:dartz/dartz.dart';
import 'package:architecture_task/core/errors/app_error.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
