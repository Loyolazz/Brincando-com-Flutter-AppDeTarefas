import 'package:flutter/material.dart';
import 'package:primeiro_app/components/task.dart';
import 'package:primeiro_app/data/task_dao.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text('TAREFAS'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task? tarefa = items?[index];
                            return tarefa;
                          });
                    }
                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            'Não há tarefas',
                            style: TextStyle(
                                fontSize: 31, color: Colors.deepOrange),
                          )
                        ],
                      ),
                    );
                  }
                  return const Text('Error ao carregar tarefas');
                  break;
              }
              return const Text('Aconteceu um erro desconhecido');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
