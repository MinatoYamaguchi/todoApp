import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoApp = ref.watch(todoAppProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          todoApp.bottomIndex == 1
              ? 'Todo一覧 (完了済み${todoApp.completedList.length}/${todoApp.unCompletedList.length + todoApp.completedList.length})'
              : 'Todo一覧 (完了済み${todoApp.unCompletedList.length}/${todoApp.unCompletedList.length + todoApp.completedList.length})',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoApp.bottomIndex == 1
              ? todoApp.completedList.length
              : todoApp.unCompletedList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  todoApp.bottomIndex == 1
                      ? '${index + 1} ${todoApp.completedList[index].title}'
                      : '${index + 1} ${todoApp.unCompletedList[index].title}',
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/detail',
                    arguments: index,
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/add',
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: todoApp.bottomIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '未完了',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: '完了',
          ),
        ],
        onTap: todoApp.bottomIndexChange,
      ),
    );
  }
}
