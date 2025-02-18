part of 'user_data_cubit.dart';

abstract class UserDataState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataLoaded extends UserDataState {
  final List<Employee> employees;
  UserDataLoaded(this.employees);
}

class UserDataError extends UserDataState {
  final String message;
  UserDataError(this.message);
}
