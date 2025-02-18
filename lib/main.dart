import 'package:architecture_task/core/services/dependancy_injection.dart';
import 'package:architecture_task/features/domain/usecase/get_user.dart';
import 'package:architecture_task/features/presentation/cubits/user_data_cubit.dart';
import 'package:architecture_task/features/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserDataCubit(getUserUseCase: sl<GetUserUseCase>())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
