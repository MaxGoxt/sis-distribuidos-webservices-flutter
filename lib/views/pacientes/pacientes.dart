import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/models/paciente.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';

class Pacientes extends StatefulWidget implements DefaultPage {
  @override
  final String namePage = 'Pacientes';

  @override
  final String description = 'Lista de pacientes registrados en el sistema.';

  @override
  final String route = '/pacientes';

  const Pacientes({super.key});

  @override
  State<Pacientes> createState() => _PacientesState();
}

class _PacientesState extends State<Pacientes> {
  final List<Paciente> pacientes = [
    Paciente(
      id: 1,
      nombre: 'Juan',
      apellido: 'Pérez',
      documento: '5.678.910-1',
      fechaNacimiento: DateTime(2000),
    ),
    Paciente(
      id: 2,
      nombre: 'María',
      apellido: 'López',
      documento: '3.456.789-0',
      fechaNacimiento: DateTime(2000),
    ),
    Paciente(
      id: 3,
      nombre: 'Carlos',
      apellido: 'García',
      documento: '4.123.456-7',
      fechaNacimiento: DateTime(2000),
    ),
    Paciente(
      id: 4,
      nombre: 'Ana',
      apellido: 'Martínez',
      documento: '8.234.567-8',
      fechaNacimiento: DateTime(2000),
    ),
    Paciente(
      id: 5,
      nombre: 'Luis',
      apellido: 'Rodríguez',
      documento: '4.890.123-9',
      fechaNacimiento: DateTime(2000),
    ),
    // Agrega más pacientes según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pacientes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: OutlinedContainer(
            child: ListTile(
              title: Text(pacientes[index].nombre),
              subtitle: Text(pacientes[index].documento),
              onTap: () {
                context.go('/pacientes/${pacientes[index].id}');
              },
            ),
          ),
        );
      },
    );
  }
}
