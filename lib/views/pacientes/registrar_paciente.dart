import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';

class RegistrarPaciente extends StatefulWidget implements DefaultPage {
  @override
  final String namePage = 'Registrar Paciente Médico';

  @override
  final String description = 'Formulario para registrar un nuevo paciente.';

  @override
  final String route = '/pacientes/registrar';

  const RegistrarPaciente({super.key});

  @override
  State<RegistrarPaciente> createState() => _RegistrarPacienteState();
}

class _RegistrarPacienteState extends State<RegistrarPaciente> {
  final String namePage = 'Registrar Paciente Médico';

  @override
  Widget build(BuildContext context) {
    return Card(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Create project').semiBold(),
          const SizedBox(height: 4),
          const Text('Deploy your new project in one-click').muted().small(),
          const SizedBox(height: 24),
          const Text('Name').semiBold().small(),
          const SizedBox(height: 4),
          const TextField(placeholder: Text('Name of your project')),
          const SizedBox(height: 16),
          const Text('Description').semiBold().small(),
          const SizedBox(height: 4),
          const TextField(placeholder: Text('Description of your project')),
          const SizedBox(height: 24),
          Row(
            children: [
              OutlineButton(child: const Text('Cancel'), onPressed: () {}),
              const Spacer(),
              PrimaryButton(child: const Text('Deploy'), onPressed: () {}),
            ],
          ),
        ],
      ),
    ).intrinsic();
  }
}
