import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/views/centros/centro_medico.dart';
import 'package:sis_distribuidos_webservices/views/centros/centros_medicos.dart';
import 'package:sis_distribuidos_webservices/views/layout.dart';
import 'package:sis_distribuidos_webservices/views/pacientes/paciente.dart';
import 'package:sis_distribuidos_webservices/views/pacientes/pacientes.dart';
import 'package:sis_distribuidos_webservices/views/centros/registrar_centro.dart';
import 'package:sis_distribuidos_webservices/views/pacientes/registrar_paciente.dart';
import 'package:sis_distribuidos_webservices/widgets/sidebar/sidebar.dart';

/// This file defines the routes for the application using the GoRouter package.

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Sidebar();
      },
      routes: <RouteBase>[
        centrosRoute,
        pacientesRoute,
      ],
    ),
  ],
);


// region Routes Centros Médicos

final GoRoute centrosRoute = GoRoute(
  path: '/centros',
  builder: (BuildContext context, GoRouterState state) {
    return const Layout(page: CentrosMedicos());
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/:id',
      builder: (BuildContext context, GoRouterState state) {
        return Layout(page: CentroMedico());
      },
    ),
    GoRoute(
      path: '/registrar',
      builder: (BuildContext context, GoRouterState state) {
        return const Layout(page: RegistrarCentro());
      },
    ),
  ],
);

// region Routes Pacientes

final GoRoute pacientesRoute = GoRoute(
  path: '/pacientes',
  builder: (BuildContext context, GoRouterState state) {
    return const Layout(page: Pacientes());
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/:id',
      builder: (BuildContext context, GoRouterState state) {
        final String id = state.pathParameters['id'] ?? '';
        return Layout(page: Paciente(id: int.parse(id)));
      },
    ),
    GoRoute(
      path: '/registrar',
      builder: (BuildContext context, GoRouterState state) {
        return const Layout(page: RegistrarPaciente());
      },
    ),
  ]
);
