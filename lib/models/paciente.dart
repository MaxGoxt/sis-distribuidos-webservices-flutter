class Paciente {
  int id;
  String nombre;
  String apellido;
  String documento;
  DateTime fechaNacimiento;

  Paciente({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.documento,
    required this.fechaNacimiento,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'documento': documento,
      'fechaNacimiento': fechaNacimiento.toIso8601String(),
    };
  }

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      documento: json['documento'],
      fechaNacimiento: DateTime.parse(json['fechaNacimiento']),
    );
  }
}
