import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist/todo/application/bloc/todo_bloc.dart';
import 'package:todolist/todo/presentation/todo_page.dart';
import 'package:uuid/uuid.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<Uuid>(const Uuid());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocProvider(
            create: (BuildContext context) => TodoBloc(
              uuid: getIt<Uuid>(),
            ),
            child: TodoPage(),
          ),
        );
      },
    );
  }
}
