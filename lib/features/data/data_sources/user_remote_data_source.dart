import 'package:architecture_task/features/domain/entities/employee_model.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  Future<List<Employee>> getEmployees();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;
  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Employee>> getEmployees() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/users');
    
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => Employee.fromJson(json))
          .toList();
    } else {
      throw Exception("Failed to load employees");
    }
  }
}
