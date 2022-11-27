import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

enum prioridades { baja, media, alta }

class _CreateTaskState extends State<CreateTask> {
  prioridades? _priority = prioridades.baja;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Text(
                      "Agrege una Tarea",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),

                  ),
                ),
                Container(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Asunto '),
                      ),
                      TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                            ), labelText: 'Contexto'),
                      ),
                      Text("Prioridad",style: TextStyle(fontSize:18,fontWeight: FontWeight.w700),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    fillColor: MaterialStateColor.resolveWith((states) => Colors.amber),
                                    focusColor: MaterialStateColor.resolveWith((states) => Colors.amber),
                                    value: prioridades.baja,
                                    groupValue: _priority,
                                    onChanged: (prioridades? value) {
                                      setState(() {
                                        _priority = value;
                                      });
                                    }),
                                Expanded(
                                  child: Text('Baja'),
                                )
                              ],
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    fillColor: MaterialStateColor.resolveWith((states) => Colors.amber),
                                    focusColor: MaterialStateColor.resolveWith((states) => Colors.amber),
                                    value: prioridades.media,
                                    groupValue: _priority,
                                    onChanged: (prioridades? value) {
                                      setState(() {
                                        _priority = value;
                                      });
                                    }),
                                Expanded(child: Text('Media'))
                              ],
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                  fillColor: MaterialStateColor.resolveWith((states) => Colors.amber),
                                    focusColor: MaterialStateColor.resolveWith((states) => Colors.amber),
                                    value: prioridades.alta,
                                    groupValue: _priority,
                                    onChanged: (prioridades? value) {
                                      setState(() {
                                        _priority = value;
                                      });
                                    }
                                    ),
                                Expanded(child: Text('alta'))
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child:  OutlinedButton(
                      onPressed: (){},
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(60),
                        backgroundColor: Colors.amber,
                        primary: Colors.black87,


                      ),child: const Text('Crear')),
                ),
                SizedBox(
                  height: 220,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
