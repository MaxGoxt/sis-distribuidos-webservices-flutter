import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/models/centro_medico.dart';
import 'package:sis_distribuidos_webservices/controllers/main.dart';
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
  final API api = API();
  List<CentroMedico> centros = [];
  bool isLoading = true;

  Future<void> _fetchCentros() async {
    try {
      var data = await api.getCentrosMedicos();
      setState(() => centros = data);
    } catch (e) {
      print('Error fetching centros médicos: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCentros();
  }

  @override
  Widget build(BuildContext context) {

    if (isLoading) {
      return Center(child: Text("Cargando centros médicos..."));
    }

    if (centros.isEmpty) {
      return Center(child: Text('No hay centros médicos registrados.'));
    }

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
