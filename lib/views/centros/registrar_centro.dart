import 'package:flutter/foundation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/controllers/main.dart';
import 'package:sis_distribuidos_webservices/models/centro_medico.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';
import 'package:go_router/go_router.dart';

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
  final API api = API();
  final String namePage = 'Registrar Centro Médico';
  int? id;
  final nombreController = TextEditingController();
  final telefonoController = TextEditingController();
  final direccionController = TextEditingController();
  String message = "";

  Widget buildToast(BuildContext context, ToastOverlay overlay) {
    return SurfaceCard(child: Basic(title: Text(message)));
  }

  Future<void> postCentroMedico() async {
    final nombre = nombreController.text;
    final telefono = telefonoController.text;
    final direccion = direccionController.text;

    if (nombre.isEmpty || telefono.isEmpty || direccion.isEmpty) {
      message = "Todos los campos son obligatorios.";
      showToast(
        context: context,
        builder: buildToast,
        location: ToastLocation.topCenter,
      );
      throw Exception(message);
    }

    try {
      final response = await api.createCentroMedico(
        CentroMedico(
          nombre: nombre,
          direccion: direccion,
          telefono: telefono,
          pacientes: [],
        ),
      );

      if (!mounted) return;

      nombreController.clear();
      telefonoController.clear();
      direccionController.clear();
      message = "Centro médico registrado exitosamente.";

      context.go('/centros/${response.id}');

      if (kDebugMode) {
        print('Centro médico registrado exitosamente: ${response.toJson()}');
      }
    } catch (e) {
      message = "Error al registrar el centro médico";
      if (kDebugMode) {
        print('Excepción al registrar centro médico: $e');
      }
    } finally {
      showToast(
        context: context,
        builder: buildToast,
        location: ToastLocation.topCenter,
      );
    }
  }

  @override
  void dispose() {
    nombreController.dispose();
    telefonoController.dispose();
    direccionController.dispose();
    super.dispose();
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
                const Text('Nombre').semiBold().small(),
                const SizedBox(height: 4),
                TextField(
                  controller: nombreController,
                  placeholder: const Text('Centro Médico A'),
                ),
                const SizedBox(height: 16),
                const Text('Teléfono').semiBold().small(),
                const SizedBox(height: 4),
                TextField(
                  controller: telefonoController,
                  placeholder: const Text('462 123 456'),
                ),
                const SizedBox(height: 16),
                const Text('Dirección').semiBold().small(),
                const SizedBox(height: 4),
                TextField(
                  controller: direccionController,
                  placeholder: const Text('Av. Principal 123'),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    OutlineButton(
                      child: const Text('Cancelar'),
                      onPressed: () {
                        // Opcional: limpiar los campos
                        nombreController.clear();
                        telefonoController.clear();
                        direccionController.clear();
                      },
                    ),
                    const Spacer(),
                    PrimaryButton(
                      child: const Text('Registrar'),
                      onPressed: () {
                        postCentroMedico();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ).intrinsic(),
    );
  }
}
