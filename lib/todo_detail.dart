import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

class TodoDetail extends ConsumerWidget {
  const TodoDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoApp = ref.read(todoAppProvider);
    final index = ModalRoute.of(context)!.settings.arguments! as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo詳細',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 4.0),
                child: const Text('タイトル'),
              ),
              Card(
                margin: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 2.0, left: 3.0),
                  width: 300,
                  height: 40,
                  child: Text(
                    todoApp.bottomIndex == 1
                        ? todoApp.completedList[index].title
                        : todoApp.unCompletedList[index].title,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 4.0),
                child: const Text('内容'),
              ),
              Card(
                margin: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 300,
                  height: 200,
                  child: Text(
                    todoApp.bottomIndex == 1
                        ? todoApp.completedList[index].title
                        : todoApp.unCompletedList[index].title,
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    todoApp.changeTodoItem(index);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    todoApp.bottomIndex == 0 ? '完了にする' : '未完了にする',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
