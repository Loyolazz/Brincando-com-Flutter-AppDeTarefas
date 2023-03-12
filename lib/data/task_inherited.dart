import 'package:flutter/material.dart';
import 'package:primeiro_app/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    const Task('Aprender Flutter', 'assets/images/passaralho.png', 2),
    const Task('Aprender React', 'assets/images/react.png', 3),
    const Task('Aprender Node', 'assets/images/nodejs.png', 5),
    const Task('Aprender Redux', 'assets/images/Redeux.webp', 4),
    const Task('Aprender React Native', 'assets/images/RN.jpg', 1)
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
