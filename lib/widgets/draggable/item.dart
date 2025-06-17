import 'package:shadcn_flutter/shadcn_flutter.dart';

class SortableItem extends StatelessWidget {
  final SortableData<Widget> item;
  final int index;
  final List<SortableData<Widget>> list;
  final List<SortableData<Widget>> targetList;
  final List<List<SortableData<Widget>>> allLists;
  final VoidCallback onUpdate;

  const SortableItem({
    super.key,
    required this.item,
    required this.index,
    required this.list,
    required this.targetList,
    required this.allLists,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Sortable<Widget>(
      data: item,
      onAcceptTop: (value) {
        swapItemInLists(allLists, value, list, index);
        onUpdate();
      },
      onAcceptBottom: (value) {
        swapItemInLists(allLists, value, list, index + 1);
        onUpdate();
      },
      child: GestureDetector(
        onTap: () { 
          swapItemInLists(allLists, item, targetList, targetList.length);
          onUpdate();
        },
        child: OutlinedContainer(
          padding: const EdgeInsets.all(12),
          child: Center(child: item.data),
        ),
      ),
    );
  }
}
