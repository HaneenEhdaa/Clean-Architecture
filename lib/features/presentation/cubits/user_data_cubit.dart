import 'package:architecture_task/features/domain/entities/employee_model.dart';
import 'package:architecture_task/features/domain/usecase/get_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final GetUserUseCase getUserUseCase;

  UserDataCubit({required this.getUserUseCase}) : super(UserDataInitial());

  Future<void> fetchUsers() async {
    emit(UserDataLoading());
    final result = await getUserUseCase(null);
    result.fold(
      (failure) => emit(UserDataError(failure.message)),
      (employees) => emit(UserDataLoaded(employees)),
    );
  }
}
