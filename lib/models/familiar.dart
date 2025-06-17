class Familiar {
  int id;
  String nombre;
  String parentesco;
  String telefono;

  Familiar({
    required this.id,
    required this.nombre,
    required this.parentesco,
    required this.telefono,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'parentesco': parentesco,
      'telefono': telefono,
    };
  }

  factory Familiar.fromJson(Map<String, dynamic> json) {
    return Familiar(
      id: json['id'],
      nombre: json['nombre'],
      parentesco: json['parentesco'],
      telefono: json['telefono'],
    );
  }
}
