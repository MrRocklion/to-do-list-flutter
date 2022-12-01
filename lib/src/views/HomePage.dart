import 'package:flutter/material.dart';
import '../scripts/task.dart';
import '../scripts/db.dart';
import '../scripts/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = ['limpiar', 'cocinar', 'jugar'];

  List<newTarea> tareas2 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: this.tareas2.length,
              itemBuilder: (BuildContext context, int index) {
                final task = this.tareas2[index];
                return (Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.task_alt),
                        title: Text(task.asunto),
                        subtitle: Text(task.contexto),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Chip(
                            labelPadding: EdgeInsets.all(2.0),
                            label: Text(
                              task.prioridad,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.redAccent,
                            elevation: 2.0,
                            shadowColor: Colors.grey[60],
                            padding: EdgeInsets.all(8.0),
                          ),
                          TextButton(
                            child: const Text('Borrar'),
                            onPressed: () {
                              eliminarTarea(task);
                            },
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('Terminar'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ));
              }),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Add code after super
    cargarDatos();
  }

  void cargarDatos() async {
    List<newTarea> _tareasdb = await DB.getData();
    print(_tareasdb);
    setState(() {
      this.tareas2 = _tareasdb;
      print(tareas2[0].asunto);
    });
  }

  void eliminarTarea(newTarea _tarea) {
    DB.delete(_tarea);
    cargarDatos();
  }
}
