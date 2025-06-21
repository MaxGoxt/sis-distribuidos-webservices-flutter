import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/models/centro_medico.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';

class CentrosMedicos extends StatefulWidget implements DefaultPage {
  @override
  final String namePage = 'Centros Médicos';

  @override
  final String description =
      'Lista de centros médicos disponibles para la atención de pacientes.';

  @override
  final String route = '/centros';

  const CentrosMedicos({super.key});

  @override
  State<CentrosMedicos> createState() => _CentrosMedicosState();
}

class _CentrosMedicosState extends State<CentrosMedicos> {
  final List<CentroMedico> centros = [
    CentroMedico(
      direccion: "",
      id: 1,
      nombre: 'Centro Médico A',
      telefono: "099 999 999",
    ),
    CentroMedico(
      direccion: "",
      id: 2,
      nombre: 'Centro Médico B',
      telefono: "096 666 666",
    ),
    CentroMedico(
      direccion: "",
      id: 3,
      nombre: 'Centro Médico C',
      telefono: "098 888 888",
    ),
    CentroMedico(
      direccion: "",
      id: 4,
      nombre: 'Centro Médico D',
      telefono: "094 444 444",
    ),
    CentroMedico(
      direccion: "",
      id: 5,
      nombre: 'Centro Médico E',
      telefono: "095 555 555",
    ),
    CentroMedico(
      direccion: "",
      id: 5,
      nombre: 'Centro Médico E',
      telefono: "095 555 555",
    ),
    CentroMedico(
      direccion: "",
      id: 5,
      nombre: 'Centro Médico E',
      telefono: "095 555 555",
    ),
    CentroMedico(
      direccion: "",
      id: 5,
      nombre: 'Centro Médico E',
      telefono: "095 555 555",
    ),
    CentroMedico(
      direccion: "",
      id: 5,
      nombre: 'Centro Médico E',
      telefono: "095 555 555",
    ),
    CentroMedico(
      direccion: "",
      id: 5,
      nombre: 'Centro Médico E',
      telefono: "095 555 555",
    ),
    CentroMedico(
      direccion: "",
      id: 5,
      nombre: 'Centro Médico E',
      telefono: "095 555 555",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: centros.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: OutlinedContainer(
            child: ListTile(
              title: Text(centros[index].nombre),
              subtitle: Text(centros[index].telefono),
              onTap: () {
                context.go('/centros/${centros[index].id}');
              },
            ),
          ),
        );
      },
    );
  }
}
