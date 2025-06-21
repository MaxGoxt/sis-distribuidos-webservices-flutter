import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/widgets/draggable/item.dart';

class SortableColumn extends StatelessWidget {
  final String title;
  final List<SortableData<Widget>> list;
  final List<List<SortableData<Widget>>> allLists;
  final List<SortableData<Widget>> targetList;
  final void Function() onUpdate;

  const SortableColumn({
    super.key,
    required this.title,
    required this.list,
    required this.allLists,
    required this.targetList,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return SortableDropFallback<Widget>(
      onAccept: (value) {
        swapItemInLists(allLists, value, list, list.length);
        onUpdate();
      },
      child: ListView(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          gap(12),
          for (int i = 0; i < list.length; i++)
            SortableItem(
              targetList: targetList,
              item: list[i],
              index: i,
              list: list,
              allLists: allLists,
              onUpdate: onUpdate,
            ),
        ],
      ),
    );
  }
}
