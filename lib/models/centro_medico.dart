class CentroMedico {
  int? id;
  String nombre;
  String direccion;
  String telefono;

  CentroMedico({
    this.id,
    required this.nombre,
    required this.direccion,
    required this.telefono,
  });

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'direccion': direccion,
      'telefono': telefono,
    };
  }

  factory CentroMedico.fromJson(Map<String, dynamic> json) {
    return CentroMedico(
      id: json['id'],
      nombre: json['nombre'],
      direccion: json['direccion'],
      telefono: json['telefono'],
    );
  }
}
