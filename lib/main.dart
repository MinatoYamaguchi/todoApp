import 'package:flutter/material.dart';
import 'todo_add.dart';
import 'todo_detail.dart';
import 'todo_item.dart';
import 'todo_list.dart';
import 'providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child:MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo app',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor:Colors.blue,
          foregroundColor:Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes:{
        '/':(context)=>const TodoList(),
        '/detail':(context)=>const TodoDetail(),
        '/add':(context)=>const TodoAddPage(),
      },      
    );
  }
}
