import 'package:flutter/widgets.dart';

abstract class DefaultPage extends Widget {
  final String namePage;
  final String description;
  final String route;

  const DefaultPage({
    super.key,
    required this.namePage,
    required this.description,
    required this.route,
  });
}
