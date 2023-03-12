import 'package:flutter/material.dart';
import 'package:primeiro_app/components/task.dart';

class InitalScreen extends StatefulWidget {
  const InitalScreen({Key? key}) : super(key: key);

  @override
  State<InitalScreen> createState() => _InitalScreenState();
}

bool opacit = true;

class _InitalScreenState extends State<InitalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('TAREFAS'),
      ),
      body: AnimatedOpacity(
        opacity: opacit ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/passaralho.png',
                2),
            Task(
                'Aprender React',
                'assets/images/react.png',
                3),
            Task(
                'Aprender Node',
                'assets/images/nodejs.png',
                5),
            Task(
                'Aprender Redux',
                'assets/images/Redeux.webp',
                4),
            Task(
                'Aprender React Native',
                'assests/images/RN.jpg',
                1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacit = !opacit;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}