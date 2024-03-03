import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'todo_item.dart';
final todoAppProvider=ChangeNotifierProvider<AppChangeNotifier>((ref)=>AppChangeNotifier());

class AppChangeNotifier extends ChangeNotifier{
    final List<TodoItem>unCompletedList=[
        TodoItem(
            id:0,
            title:'hoge',
            content:'hogehoge',
            isCompleted:false,
        ),
        TodoItem(
            id:1,
            title:'ggh',
            content:'jhbeb',
            isCompleted:true,
        ),
    ];
    final List<TodoItem>completedList=[
        TodoItem(
            id:2,
            title:'fluttet',
            content:'python',
            isCompleted:false,
        ),
        TodoItem(
            id:3,
            title:'nvjhdb',
            content:'vuebv',
            isCompleted:true,
        ),
    ];

    int bottomIndex=0;

    List<TodoItem>get shownList{
        if(bottomIndex==0){
            return completedList;
        }else{
            return unCompletedList;
        }
    }
        
    void bottomIndexChange(int index){
        bottomIndex=index;
        notifyListeners();
    } 


    void addTodoItem(Map<String,String> formValue){
        unCompletedList.add(
            TodoItem(
                id:unCompletedList.length+completedList.length,
                title:formValue['title']!,
                content:formValue['content']!,
                isCompleted:false,
            ),
        );
        notifyListeners();
    }

    void replaceTodoItem(int index){
        final specifiedItem=shownList[index];
        specifiedItem.toggleIsCompleted();
        if(shownList[index].isCompleted){
            completedList.removeAt(index);
            unCompletedList.add(specifiedItem);
        }else{
            unCompletedList.removeAt(index);
            completedList.add(specifiedItem);
        }
        notifyListeners();
    }
}