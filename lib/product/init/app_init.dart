import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../controller/global_controller.dart';

class AppInit {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<GlobalController>(
      create: (context) => GlobalController(),
    )
  ];
}
