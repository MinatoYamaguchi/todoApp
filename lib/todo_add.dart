import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

class TodoAddPage extends ConsumerStatefulWidget {
  const TodoAddPage({super.key});
  @override
  ConsumerState<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends ConsumerState<TodoAddPage> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> formValue = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo追加',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40.0),
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'タイトル',
                  ),
                  maxLength: 30,
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) {
                    formValue['title'] = value.toString();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '入力してください';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40.0),
                width: 300,
                child: TextFormField(
                  minLines: 6,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: '内容',
                  ),
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) {
                    formValue['content'] = value.toString();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '入力してください';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      ref.read(todoAppProvider).addTodoItem(formValue);
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Todoを追加',
                    style: TextStyle(color: Colors.white),
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
