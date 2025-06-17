import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';
import 'package:sis_distribuidos_webservices/widgets/draggable/column.dart';

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
                      title: 'Centro Médico',
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
      ],
    );
  }
}

/*
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/widgets/draggable/column.dart';

class CentroMedico extends StatefulWidget {
  const CentroMedico({super.key});
  final String namePage = 'Centro Médico';

  @override
  State<CentroMedico> createState() => _CentroMedicoState();
}

class _CentroMedicoState extends State<CentroMedico> {
  List<SortableData<Widget>> colCentroMedico = [
    const SortableData(Placeholder(fallbackHeight: 20)),
  ];

  List<SortableData<Widget>> colPacientes = [
    const SortableData(Text('David')),
    const SortableData(Text('Richard')),
    const SortableData(Text('Joseph')),
    const SortableData(Text('Thomas')),
    const SortableData(Text('Charles')),
  ];

  void swapItemInLists<T>({
    required T element,
    required List<T> from,
    required List<T> to,
    required int index,
  }) {
    from.remove(element);
    // to.remove(element); // En caso de error previa o duplicado
    to.swapItem(element, index);
  }

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
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: SortableDropFallback<Widget>(
                      onAccept: (value) {
                        setState(() {
                          swapItemInLists(
                            element: value,
                            from: colCentroMedico,
                            to: colPacientes,
                            index: colPacientes.length,
                          );
                        });
                      },
                      child: DraggableColumn(
                        list: colCentroMedico,
                        targetList: colPacientes,
                        swapItemInLists: swapItemInLists,
                      ),
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
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: SortableDropFallback<String>(
                      onAccept: (value) {
                        setState(() {
                          swapItemInLists(
                            element: value,
                            from: colPacientes,
                            to: colCentroMedico,
                            index: colCentroMedico.length,
                          );
                        });
                      },
                      child: DraggableColumn(
                        list: colPacientes,
                        targetList: colCentroMedico,
                        swapItemInLists: swapItemInLists,
                      ),
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
      ],
    );
  }
}

 */
