import 'package:flutter/material.dart';
import 'providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoAddPage extends ConsumerStatefulWidget{
    const TodoAddPage({Key? key}):super(key:key);

    @override
    ConsumerState<TodoAddPage> createState()=>_TodoAddPageState();
}

class _TodoAddPageState extends ConsumerState<TodoAddPage>{
    final _formKey=GlobalKey<FormState>();
    Map<String,String>formValue={};

    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar:AppBar(
                title:Text('Todo追加',
                    style:TextStyle(color:Colors.white),
                ),
                backgroundColor:Colors.blue,
            ),
            body:Form(
                key:_formKey,
                child:Center(
                    child:Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                            Container(
                                margin:EdgeInsets.only(bottom:40.0),
                                width:300,
                                child:TextFormField(
                                    decoration:InputDecoration(
                                        labelText:'タイトル',
                                    ),
                                    maxLength:30,
                                    keyboardType:TextInputType.multiline,
                                    onSaved:(value){
                                        formValue['title']=value.toString();
                                    },
                                    validator:(value){
                                        if(value==null||value.isEmpty){
                                            return '入力してください';
                                        }else{
                                            return null;
                                        }
                                    },
                                ),
                            ),
                            Container(
                                margin:EdgeInsets.only(bottom:40.0),           
                                width:300,
                                child:TextFormField(
                                    minLines:6,
                                    maxLines:null,
                                    decoration:InputDecoration(
                                        border:OutlineInputBorder(),
                                        floatingLabelBehavior:FloatingLabelBehavior.always,
                                        labelText:'内容',
                                    ),
                                    keyboardType:TextInputType.multiline,
                                    onSaved:(value){
                                        formValue['content']=value.toString();
                                    },
                                    validator:(value){
                                        if(value==null||value.isEmpty){
                                            return '入力してください';
                                        }else{
                                            return null;
                                        }
                                    },
                                ),
                            ),
                            Container(
                                width:300,
                                child:ElevatedButton(
                                    onPressed:(){
                                        if(_formKey.currentState!.validate()){
                                            _formKey.currentState?.save();
                                            ref.read(todoAppProvider).addTodoItem(formValue);
                                            Navigator.of(context).pop();
                                        }
                                    },
                                    child:Text('Todoを追加',
                                        style:TextStyle(color:Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:Colors.blue
                                    )
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}