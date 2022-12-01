class newTarea {
  int id;
  String asunto;
  String contexto;
  String prioridad;
  newTarea(this.id, this.asunto, this.contexto, this.prioridad);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'asunto': asunto,
      'contexto': contexto,
      'prioridad': prioridad,
    };
  }
  // Class Function
}
