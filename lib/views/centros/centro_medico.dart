import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';
import 'package:sis_distribuidos_webservices/widgets/draggable/column.dart';
import 'package:sis_distribuidos_webservices/models/centro_medico.dart' as model;

class CentroMedico extends StatefulWidget implements DefaultPage {
  const CentroMedico({super.key});

  @override
  final String namePage = 'Centro Médico';
  
  @override
  final String description = 'Administración de centros médicos y pacientes';

  @override
  final String route = 'centro-medico';

  @override
  State<CentroMedico> createState() => _CentroMedicoState();
}

class _CentroMedicoState extends State<CentroMedico> {

  final model.CentroMedico centro = model.CentroMedico(
    id: 1,
    nombre: 'Centro Médico A',
    direccion: 'Av. Principal 123',
    telefono: '099 999 999',
  );

  List<SortableData<Widget>> colCentroMedico = [];

  List<SortableData<Widget>> colPacientes = [
    const SortableData(Text('David')),
    const SortableData(Text('Richard')),
    const SortableData(Text('Joseph')),
    const SortableData(Text('Thomas')),
    const SortableData(Text('Charles')),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Column(
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
                      title: centro.nombre,
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
                const Text('Paciente').semiBold(),
                const SizedBox(height: 4),
                Text(centro.nombre).muted().small(),

                const SizedBox(height: 24),
                const Text('Documento').semiBold().small(),

                const SizedBox(height: 4),
                Text(centro.telefono).muted().small(),

                const SizedBox(height: 4),
                Text(centro.direccion).muted().small(),

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
      ],
    );
  }
}
