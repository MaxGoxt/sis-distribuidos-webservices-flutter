import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';
import 'package:sis_distribuidos_webservices/models/paciente.dart' as model;

class Paciente extends StatefulWidget implements DefaultPage {
  @override
  final String namePage = 'Paciente Médico';

  @override
  final String description = '';

  final int id;

  @override
  final String route;

  const Paciente({super.key, required this.id}) : route = '/paciente/$id';

  @override
  State<Paciente> createState() => _PacienteState();
}

class _PacienteState extends State<Paciente> {
  late String namePage;
  late int id;
  late model.Paciente paciente;

  @override
  void initState() {
    super.initState();
    namePage = widget.namePage;
    id = widget.id;
    paciente = model.Paciente(
      id: id,
      nombre: 'John',
      apellido: 'Doe',
      documento: '123456789',
      fechaNacimiento: DateTime(1990, 1, 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child:
          Card(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Paciente').semiBold(),
                const SizedBox(height: 4),
                Text('${paciente.nombre} ${paciente.apellido}').muted().small(),

                const SizedBox(height: 24),
                const Text('Documento').semiBold().small(),

                const SizedBox(height: 4),
                Text(paciente.documento).muted().small(),

                const SizedBox(height: 16),
                Row(
                  children: [
                    OutlineButton(
                      child: const Text('Editar'),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    PrimaryButton(
                      child: const Text('Eliminar'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ).intrinsic(),
    );
  }
}
