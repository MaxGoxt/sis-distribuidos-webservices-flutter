import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';

class RegistrarCentro extends StatefulWidget implements DefaultPage {
  @override
  final String namePage = 'Registrar Centro Médico';

  @override
  final String description =
      'Formulario para registrar un nuevo centro médico.';

  @override
  final String route = '/centros/registrar';

  const RegistrarCentro({super.key});

  @override
  State<RegistrarCentro> createState() => _RegistrarCentroState();
}

class _RegistrarCentroState extends State<RegistrarCentro> {
  final String namePage = 'Registrar Centro Médico';

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
                const Text('Create project').semiBold(),
                const SizedBox(height: 4),
                const Text(
                  'Deploy your new project in one-click',
                ).muted().small(),
                const SizedBox(height: 24),
                const Text('Name').semiBold().small(),
                const SizedBox(height: 4),
                const TextField(placeholder: Text('Name of your project')),
                const SizedBox(height: 16),
                const Text('Description').semiBold().small(),
                const SizedBox(height: 4),
                const TextField(
                  placeholder: Text('Description of your project'),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    OutlineButton(
                      child: const Text('Cancel'),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    PrimaryButton(
                      child: const Text('Deploy'),
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
