import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:sis_distribuidos_webservices/views/page.d.dart';
import 'package:sis_distribuidos_webservices/widgets/header/header.dart';
import 'package:sis_distribuidos_webservices/widgets/sidebar/sidebar.dart';

class Layout extends StatefulWidget {
  final DefaultPage page;

  const Layout({super.key, required this.page});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  late final DefaultPage page;

  @override
  void initState() {
    super.initState();
    page = widget.page;
  }

  void open(BuildContext context) {
    openDrawer(
      context: context,
      expands: true,
      builder: (context) {
        return Sidebar();
      },
      position: OverlayPosition.left,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        headers: [
          Header(
            namePage: page.namePage,
            route: page.route,
            onOpen: () {
              open(context);
            },
            addMore: () {
              // Add more functionality here
            },
          ),
          const Divider(),
        ],
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: page,
        ),
      ),
    );
  }
}
