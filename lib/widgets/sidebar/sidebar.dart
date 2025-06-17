import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';


class Sidebar extends StatelessWidget {

  static final List<String> routes = [
    '/centros',
    '/pacientes',
  ];

  const Sidebar({super.key});

  NavigationBarItem buildButton(String label, IconData icon) {
  return NavigationItem(
    label: Text(label),
    child: GestureDetector(child: Icon(icon)),

  );
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width * 0.75,
      child: OutlinedContainer(
        child: NavigationSidebar(
          onSelected: (index){
            context.go(routes[index]);
          },
          children: [
            NavigationLabel(child: Text('Centros Médicos')),
            buildButton('Ver centros médicos', BootstrapIcons.hospital),
            NavigationGap(24),
            NavigationDivider(),
            NavigationLabel(child: Text('Pacientes')),
            buildButton('Ver pacientes', BootstrapIcons.personCircle),
          ],
        ),
      ),
    );
  }
}