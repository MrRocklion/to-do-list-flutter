import 'package:flutter/material.dart';
import '../scripts/task.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = ['limpiar','cocinar','jugar'];

  List<newTarea> tareas2 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: this.tareas2.length,
              itemBuilder: (BuildContext context , int index){
                final task = this.tareas2[index];
                return(
                  Card(
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
                            TextButton(
                              child: const Text('Borrar'),
                              onPressed: () {/* ... */},
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
                  )
                );
              }

          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    // Add code after super
    final t1 =  newTarea("Limpiar","como estas","alta");
    final t2 =  newTarea('cocinar',"como estas","baja");
    final t3 =  newTarea('Comprar Comida',"como estas","media");
    setState(() {
    tareas2 = [t1,t2,t3];
    print(tareas2[0].asunto);
    });
  }
}
