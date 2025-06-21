import 'package:shadcn_flutter/shadcn_flutter.dart';

class Toast extends StatefulWidget {
  final ToastOverlay overlay;
  const Toast({super.key, required this.overlay});

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  late ToastOverlay overlay;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Basic(
        title: const Text('Event has been created'),
        subtitle: const Text('Sunday, July 07, 2024 at 12:00 PM'),
        trailing: PrimaryButton(
          size: ButtonSize.small,
          onPressed: () {
            overlay.close();
          },
          child: const Text('Undo'),
        ),
        trailingAlignment: Alignment.center,
      ),
    );
  }
}
