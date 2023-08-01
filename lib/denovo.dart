import 'package:agora_vai/data/task_inherited.dart';

import 'package:flutter/material.dart';
import 'Inicio.dart';

void main() => runApp(const Gui());

class Gui extends StatelessWidget {
  const Gui({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Tarefas',
      home: TaskInherited(child: const Inicio(),),
    );
  }
}








