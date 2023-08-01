import 'package:agora_vai/data/task_inherited.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController nomeControle = TextEditingController();
  TextEditingController dificuldadeControle = TextEditingController();
  TextEditingController imagemControle = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Adicionar nova'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Põe uma tarefa mano!';
                        }
                        return null;
                      },
                      controller: nomeControle,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'É de 1 a 5, se liga!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: dificuldadeControle,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Uma URL válida por favor!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imagemControle,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imagemControle.text,
                        errorBuilder: (BuildContext context, Object exception,
                            stackTrace) {
                          return Image.asset(
                            'assets/images/cadeado.jpg',
                            fit: BoxFit.cover,
                          );
                        },
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        // print(nomeControle.text);
                        // print(dificuldadeControle.text);
                        // print(imagemControle.text);
                        TaskInherited.of(widget.taskContext).newTask(nomeControle.text,
                            imagemControle.text, int.parse(dificuldadeControle.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tá indo filhão'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Incluir'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
