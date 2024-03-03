import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';


class TodoList extends ConsumerWidget{
    const TodoList({Key? key}):super(key:key);

    @override
    Widget build(BuildContext context, WidgetRef ref){
        final todoApp=ref.watch(todoAppProvider);
        return Scaffold(
            appBar:AppBar(
                title:Text('Todo一覧 (完了済み${todoApp.completedList.length}/${todoApp.unCompletedList.length+todoApp.completedList.length})',
                    style:TextStyle(color:Colors.white),
                ),
                backgroundColor:Colors.blue,
            ),
            body: Center(
                child:ListView.builder(
                    itemCount:todoApp.shownList.length,
                    itemBuilder:(BuildContext context,int index){
                        return Card(
                            child:ListTile(
                                title:Text('${index+1} ${todoApp.shownList[index].title}'),
                                onTap:(){
                                    Navigator.of(context).pushNamed(
                                        '/detail',
                                        arguments:index,
                                    );
                                },
                            ),
                        );
                    },
                ),
            ),
            floatingActionButton:FloatingActionButton(
                onPressed:(){
                    Navigator.of(context).pushNamed(
                        '/add',
                    );
                },
                backgroundColor:Colors.blue,
                child:Icon(Icons.add),
            ),
            bottomNavigationBar:BottomNavigationBar(
                currentIndex:todoApp.bottomIndex,
                items:const[
                    BottomNavigationBarItem(
                        icon:Icon(Icons.bookmark),
                        label:'未完了',
                    ),
                    BottomNavigationBarItem(
                        icon:Icon(Icons.done),
                        label:'完了',
                    ),
                ],
                onTap:todoApp.bottomIndexChange,
            ),
        );
    }


}




