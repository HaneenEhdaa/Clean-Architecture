import 'package:architecture_task/features/presentation/cubits/user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeView extends StatelessWidget {
  const EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee List")),
      body: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, state) {
          if (state is UserDataLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          } else if (state is UserDataLoaded) {
            return ListView.builder(
              itemCount: state.employees.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Name: ${state.employees[index].name}"),
                  subtitle: Text("Email: ${state.employees[index].email}"),
                  trailing: Icon(Icons.person),
                );
              },
            );
          } else if (state is UserDataError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }
          return Center(child: Text("Press the button to load employees"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserDataCubit>().fetchUsers();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
