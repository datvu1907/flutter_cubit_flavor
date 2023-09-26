import 'package:bloc_tutorial/repository/todo_repository.dart';
import 'package:bloc_tutorial/screens/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo/todo_cubit.dart';

class MyApp extends StatelessWidget {
  final String flavor;
  const MyApp({super.key, required this.flavor});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoCubit(TodoRepository()),
        ),
        // BlocProvider(
        //   create: (context) => TodoCubit(TodoRepository()),
        // ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoPage(),
      ),
    );
  }
}