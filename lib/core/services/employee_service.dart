
import 'package:architecture_task/features/domain/entities/employee_model.dart';
import 'package:dio/dio.dart';

class EmployeeService {
  String endPoint = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Employee>> getEmpolyee() async {
    List<Employee> employee = [];

    try {
      var response = await Dio().get(endPoint);
      var empData = response.data;
      empData.forEach((json) {
        Employee emp = Employee.fromJson(json);
        employee.add(emp);
      });
    } catch (e) {
      print(e.toString());
    }
    return employee;
  }
}
