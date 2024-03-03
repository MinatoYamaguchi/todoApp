import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'todo_item.dart';

final todoAppProvider =
    ChangeNotifierProvider<AppChangeNotifier>((ref) => AppChangeNotifier());

class AppChangeNotifier extends ChangeNotifier {
  final List<TodoItem> unCompletedList = [
    TodoItem(
      id: 0,
      title: 'dart',
      content: 'dart-content',
      isCompleted: false,
    ),
    TodoItem(
      id: 1,
      title: 'ssh',
      content: 'ssh',
      isCompleted: false,
    ),
  ];
  final List<TodoItem> completedList = [
    TodoItem(
      id: 2,
      title: 'python',
      content: '再帰関数',
      isCompleted: true,
    ),
    TodoItem(
      id: 3,
      title: 'flutter',
      content: '非同期処理',
      isCompleted: true,
    ),
  ];

  int bottomIndex = 0;

  void bottomIndexChange(int index) {
    bottomIndex = index;
    notifyListeners();
  }

  void addTodoItem(Map<String, String> formValue) {
    unCompletedList.add(
      TodoItem(
        id: unCompletedList.length + completedList.length,
        title: formValue['title']!,
        content: formValue['content']!,
        isCompleted: false,
      ),
    );
    notifyListeners();
  }

  void changeTodoItem(int index) {
    final TodoItem specifiedItem;
    if (bottomIndex == 1) {
      specifiedItem = completedList[index];
    } else {
      specifiedItem = unCompletedList[index];
    }
    specifiedItem.toggleIsCompleted();
    if (specifiedItem.isCompleted) {
      completedList.removeAt(index);
      unCompletedList.add(specifiedItem);
    } else {
      unCompletedList.removeAt(index);
      completedList.add(specifiedItem);
    }
    notifyListeners();
  }
}
