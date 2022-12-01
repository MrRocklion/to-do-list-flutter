import 'package:flutter/material.dart';
import 'dart:math';
import '../scripts/db.dart';
import '../scripts/task.dart';
class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

enum prioridades { baja, media, alta }

class _CreateTaskState extends State<CreateTask> {
  prioridades? _priority = prioridades.baja;
  final asuntotxt = TextEditingController();
  final contextotxt  = TextEditingController();
  String _asunto = " ";
  String _contexto = " ";
  String _prioridad = "Baja";
  int _id = 213;
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
                        controller: asuntotxt,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Asunto '),
                        onChanged: (text){
                          setState(() {
                            this._asunto = text;
                          });
                      }
                      ),
                      TextField(
                        maxLines: null,
                        controller: contextotxt,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                            ), labelText: 'Contexto'),

                          onChanged: (text){
                            setState(() {
                              this._contexto = text;
                            });
                          }
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
                                        this._priority = value;
                                        this._prioridad  = "Baja";
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
                                        this._prioridad  = "Media";
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
                                        this._prioridad  = "Alta";
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
                      onPressed: crearTarea,
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

  void crearTarea(){
    var rng = Random();
    setState(() {
      this._id = rng.nextInt(4000) ;
    });
    asuntotxt.clear();
    contextotxt.clear();
    final _tarea = newTarea(this._id, this._asunto, this._contexto, this._prioridad);
    DB.insert(_tarea);
  }
}
