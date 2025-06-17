import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  final String namePage;
  final String route;
  final void Function() onOpen;
  final void Function() addMore;

  const Header({
    super.key,
    required this.namePage,
    required this.route,
    required this.onOpen,
    required this.addMore,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('App Medica'),
      subtitle: Text(namePage),
      leading:
          route.contains('registrar')
              ? [
                OutlineButton(
                  onPressed: () {
                    context.pop();
                  },
                  density: ButtonDensity.icon,
                  child: const Icon(Icons.arrow_back),
                ),
              ]
              : [
                OutlineButton(
                  onPressed: () {
                    onOpen();
                  },
                  density: ButtonDensity.icon,
                  child: const Icon(Icons.menu),
                ),
              ],
      trailing:
          !route.contains('registrar')
              ? [
                OutlineButton(
                  onPressed: () {
                    context.go('$route/registrar');
                  },
                  density: ButtonDensity.icon,
                  child: const Icon(Icons.add),
                ),
              ]
              : [],
    );
  }
}
