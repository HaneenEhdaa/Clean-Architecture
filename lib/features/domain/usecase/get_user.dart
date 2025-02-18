import 'package:architecture_task/core/usecases/usecase.dart';
import 'package:architecture_task/features/domain/entities/employee_model.dart';
import 'package:architecture_task/features/domain/repositories/domain_user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:architecture_task/core/errors/app_error.dart';

class GetUserUseCase extends BaseUseCase<List<Employee>, void> {
  final UserRepository userRepository;

  GetUserUseCase({required this.userRepository});

  @override
  Future<Either<AppError, List<Employee>>> call(void params) async {
    return await userRepository.getUserData();
  }
}
