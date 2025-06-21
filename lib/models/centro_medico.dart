import 'package:sis_distribuidos_webservices/models/paciente.dart';

class CentroMedico {
  int? id;
  String nombre;
  String direccion;
  String telefono;
  List<Paciente> pacientes;

  CentroMedico({
    this.id,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.pacientes,
  });

  Map<String, dynamic> toJson() {
    return {'nombre': nombre, 'direccion': direccion, 'telefono': telefono};
  }

  factory CentroMedico.fromMap(Map<String, dynamic> json) {
    return CentroMedico(
      id: json['id'],
      nombre: json['nombre'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      pacientes:
          (json['pacientes'] as List<dynamic>)
              .map((item) => Paciente.fromMap(item as Map<String, dynamic>))
              .toList(),
    );
  }
}
