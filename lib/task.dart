import 'package:agora_vai/Dificuldade.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNet() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black12,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: assetOrNet() ? Image.asset(
                              widget.foto,
                              fit: BoxFit.cover,
                            ) : Image.network(widget.foto, fit: BoxFit.cover,)
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.nome,
                            style: const TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Difficulty(difficultyLevel: widget.dificuldade,
                          ),
                        ],
                      ), // texto das tarefas

                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.nivel++;
                              });
                              //print(nivel);
                            },
                            child: const Icon(
                              Icons.arrow_drop_up,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.nivel--;
                              });
                              //print(nivel);
                            },
                            child: const Icon(
                              Icons.arrow_drop_down,
                            ),
                          ),
                        ],
                      ) // botoes de nivel
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                            color: Colors.white,
                            value: (widget.dificuldade > 0)
                                ? (widget.nivel / widget.dificuldade) / 10
                                : 1),
                      ),
                    ), // barra de nivel
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Nivel ${widget.nivel}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ), // niveis
                  ],
                ), // linha dos niveis
              ],
            ),
          ],
        ),

    );
  }
}