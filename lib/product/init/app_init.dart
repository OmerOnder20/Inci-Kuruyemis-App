import 'package:inci_kuruyemis/feature/anaSayfa/viewModel/ana_sayfa_provider.dart';
import 'package:inci_kuruyemis/product/controller/user_controller.dart';
import 'package:inci_kuruyemis/product/service/kategori_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../controller/global_controller.dart';

class AppInit {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<GlobalController>(
      create: (context) => GlobalController(),
    ),
    ChangeNotifierProvider<AnaSayfaProvider>(
      create: (context) => AnaSayfaProvider(KategoriService()),
    ),
    ChangeNotifierProvider<UserController>(
      create: (context) => UserController(),
    ),
  ];
}
