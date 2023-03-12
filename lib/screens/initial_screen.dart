import 'package:flutter/material.dart';
import 'package:primeiro_app/components/task.dart';
import 'package:primeiro_app/data/task_inherited.dart';
import 'package:primeiro_app/screens/form_screen.dart';

class InitalScreen extends StatefulWidget {
  const InitalScreen({Key? key}) : super(key: key);

  @override
  State<InitalScreen> createState() => _InitalScreenState();
}

class _InitalScreenState extends State<InitalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('TAREFAS'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8,bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context,),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
