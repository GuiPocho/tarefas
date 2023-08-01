import 'dart:ffi';

import 'package:agora_vai/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited ({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList =[
    Task(
      'Estudar',
      'https://i.pinimg.com/564x/08/a1/e9/08a1e908ee334dad2e6cccd77b29bcd7.jpg',
      2),
    Task(
        'Arrumar a toca',
        'https://i.pinimg.com/564x/47/c5/ae/47c5ae8f718359066eee25ede45b27fe.jpg',
        5),
    Task(
        'Fazer comida',
        'https://i.pinimg.com/564x/99/26/64/99266485fa881dd0d5f769d3679e0e15.jpg',
        4),
    Task(
        'Estudar mais',
        'https://i.pinimg.com/564x/3b/9e/30/3b9e303d588ad9708de647b0b33aef7a.jpg',
        2),
    Task(
        'Falar com a Mo!',
        'https://i.pinimg.com/564x/36/b4/67/36b46762cce085da01ff583c513273eb.jpg',
        1),
  ];

  void newTask(String nome, String foto, int dificuldade,){
    taskList.add(Task(nome, foto, dificuldade,));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No  found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
