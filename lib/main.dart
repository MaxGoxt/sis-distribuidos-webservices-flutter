import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp.router(
      title: 'My App',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorSchemes.lightBlue(),
        radius: 0.5,
      ),
    );
  }
}
