import 'providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';


class TodoDetail extends ConsumerWidget {
    const TodoDetail({Key? key}):super(key:key);

    @override
    Widget build(BuildContext context, WidgetRef ref){
        final todoApp=ref.read(todoAppProvider);
        final index=ModalRoute.of(context)!.settings.arguments! as int;
        return Scaffold(
            appBar:AppBar(
                title:Text('Todo詳細',
                    style:TextStyle(color:Colors.white),
                ),
                backgroundColor:Colors.blue,
            ),
            body:Center(
                child:Container(
                    width:300,
                    child:Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                            Container(
                                alignment:Alignment.centerLeft,
                                margin:EdgeInsets.only(bottom:4.0),
                                child:Text('タイトル'),
                            ),
                            Card(
                                margin:EdgeInsets.only(bottom:40.0),
                                child:Container(
                                    // margin:EdgeInsets.only(bottom:40.0),
                                    margin:EdgeInsets.only(top:2.0,left:3.0),
                                    width:300,
                                    height:40,
                                    child:Text(todoApp.shownList[index].title),
                                ),
                            ),
                            Container(
                                alignment:Alignment.centerLeft,
                                margin:EdgeInsets.only(bottom:4.0),
                                child:Text('内容'),
                            ),
                            Card(
                                margin:EdgeInsets.only(bottom:42.0),
                                child:Container(
                                    margin:EdgeInsets.all(8.0),
                                    width:300,
                                    height:200,
                                    child:Text(todoApp.shownList[index].content),
                                ),
                            ),
                            Container(
                                width:300,
                                child:ElevatedButton(
                                    onPressed:(){
                                        todoApp.replaceTodoItem(index);
                                        Navigator.of(context).pop();
                                    },
                                    child:Text(
                                        todoApp.shownList[index].isCompleted ?'完了にする':'未完了にする',
                                        style:TextStyle(color:Colors.white),
                                        ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:Colors.blue
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



