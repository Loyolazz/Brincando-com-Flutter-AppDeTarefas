import 'package:flutter/material.dart';
import 'package:primeiro_app/data/task_dao.dart';

import 'difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int dificul;

  const Task(this.name, this.photo, this.dificul, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  bool assetOrNetwork() {
    if (widget.photo.contains('https')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.green),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white),
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.black26),
                          width: 72,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: assetOrNetwork()
                                ? Image.asset(widget.photo, fit: BoxFit.cover)
                                : Image.network(widget.photo,
                                    fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Difficulty(
                              dificultyLevel: widget.dificul,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 52,
                            width: 52,
                            child: ElevatedButton(
                              onLongPress: (){
                                TaskDao().delete(widget.name);
                              },
                                onPressed: () {
                                  setState(() {
                                    level++;
                                  });
                                  print(level);
                                },
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(Icons.arrow_drop_up),
                                    Text(
                                      'Up',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                )),
                          ),
                        )
                      ]),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.cyan,
                          value: (widget.dificul > 0)
                              ? (level / widget.dificul) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Level: $level',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
