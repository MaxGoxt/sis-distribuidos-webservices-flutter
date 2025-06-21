import 'package:flutter/foundation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/controllers/main.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';
import 'package:sis_distribuidos_webservices/widgets/draggable/column.dart';
import 'package:sis_distribuidos_webservices/models/centro_medico.dart'
    as model;

class CentroMedico extends StatefulWidget implements DefaultPage {
  @override
  final String namePage = 'Centro Médico';

  @override
  final String description = 'Administración de centros médicos y pacientes';

  final int id;

  @override
  final String route;

  const CentroMedico({super.key, required this.id}) : route = '/centros/$id';

  @override
  State<CentroMedico> createState() => _CentroMedicoState();
}

class _CentroMedicoState extends State<CentroMedico> {
  final API api = API();
  model.CentroMedico? centro;
  bool isLoading = true;
  late List<SortableData<Widget>> colCentroMedico = [];
  late List<SortableData<Widget>> colPacientes = [];

  Future<void> _fetchCentro(int id) async {
    try {
      var data = await api.getCentroMedicoById(id);
      setState(() {
        centro = data;
        colCentroMedico = [
          ...data.pacientes.map(
            (paciente) => SortableData(Text(paciente.nombre)),
          ),
        ];
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching centros médicos: $e');
      }
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _fetchPacientes() async {
    try {
      var data = await api.getPacientes();
      setState(() {
        colPacientes = [
          ...data
              .where(
                (paciente) =>
                    !(centro?.pacientes.any((p) => p.id == paciente.id) ??
                        false),
              )
              .map((paciente) => SortableData(Text(paciente.nombre))),
        ];
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching pacientes: $e');
      }
    }
  }

  Future<void> _deleteCentro(int id) async {
    try {
      await api.deleteCentroMedico(id);
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting centro médico: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    await _fetchCentro(widget.id);
    await _fetchPacientes();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    if (isLoading) {
      return Center(child: Text("Cargando centros médicos..."));
    }

    if (centro == null) {
      return Center(child: Text('No se encontró este centro médico.'));
    }

    return ListView(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height / 2),
          child: SortableLayer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.gray.shade800),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SortableColumn(
                      title: centro!.nombre,
                      list: colCentroMedico,
                      allLists: [colCentroMedico, colPacientes],
                      targetList: colPacientes,
                      onUpdate: () => setState(() {}),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.gray.shade800),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SortableColumn(
                      title: 'Pacientes',
                      list: colPacientes,
                      allLists: [colCentroMedico, colPacientes],
                      targetList: colCentroMedico,
                      onUpdate: () => setState(() {}),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(top: 12),
          child: Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryButton(onPressed: () {}, child: const Text('Guardar')),
              DestructiveButton(
                onPressed: () {},
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Card(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Centro Médico').semiBold(),
              const SizedBox(height: 4),
              Text(centro!.nombre).muted().small(),

              const SizedBox(height: 24),
              const Text('Teléfono').semiBold().small(),

              const SizedBox(height: 4),
              Text(centro!.telefono).muted().small(),

              const SizedBox(height: 4),
              Text(centro!.direccion).muted().small(),

              const SizedBox(height: 16),
              Row(
                children: [
                  OutlineButton(child: const Text('Editar'), onPressed: () {}),
                  const Spacer(),
                  PrimaryButton(
                    child: const Text('Eliminar'),
                    onPressed: () {
                      _deleteCentro(widget.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ).intrinsic(),
      ],
    );
  }
}
