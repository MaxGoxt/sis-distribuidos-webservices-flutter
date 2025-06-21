import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/controllers/main.dart';
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
  List<Paciente> pacientes = []; // ← ✅ lista inicial vacía
  bool isLoading = true;         // ← opcional: para mostrar un loader

  final API api = API();

  Future<void> _fetchPacientes() async {
    try {
      var data = await api.getPacientes();
      setState(() {
        pacientes = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching pacientes: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPacientes();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: Text("Cargando pacientes..."));
    }

    if (pacientes.isEmpty) {
      return Center(child: Text('No hay pacientes registrados.'));
    }

    return ListView.builder(
      itemCount: pacientes.length,
      itemBuilder: (context, index) {
        final paciente = pacientes[index];
        return Padding(
          padding: EdgeInsets.all(10),
          child: OutlinedContainer(
            child: ListTile(
              title: Text(paciente.nombre),
              subtitle: Text(paciente.documento),
              onTap: () {
                context.go('/pacientes/${paciente.id}');
              },
            ),
          ),
        );
      },
    );
  }
}
