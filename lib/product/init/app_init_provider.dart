import 'package:inci_kuruyemis/feature/kampanya/viewModel/kampanya_view_model.dart';
import 'package:inci_kuruyemis/feature/odemeSe%C3%A7enekleri/viewModel/%C3%B6deme_se%C3%A7enekleri_provider.dart';
import 'package:inci_kuruyemis/feature/anaSayfa/viewModel/ana_sayfa_provider.dart';
import 'package:inci_kuruyemis/feature/kargoTeslimat/viewModel/kargo_teslimat_provider.dart';
import 'package:inci_kuruyemis/product/controller/cart_controller.dart';
import 'package:inci_kuruyemis/product/controller/internet_controller.dart';
import 'package:inci_kuruyemis/product/controller/user_controller.dart';
import 'package:inci_kuruyemis/product/service/d%C3%B6k%C3%BCman_service.dart';
import 'package:inci_kuruyemis/product/service/kampanya_service.dart';
import 'package:inci_kuruyemis/product/service/kategori_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../controller/global_controller.dart';

class AppInitProvider {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<AnaSayfaProvider>(
      create: (context) => AnaSayfaProvider(KategoriService()),
    ),
    ChangeNotifierProvider<OdemeProvider>(
        create: (context) => OdemeProvider(DokumanService())),
    ChangeNotifierProvider<KargoProvider>(
        create: (context) => KargoProvider(DokumanService())),
    ChangeNotifierProvider<KampanyaProvider>(
        create: (context) => KampanyaProvider(KampanyaService())),
    ChangeNotifierProvider<GlobalController>(
      create: (context) => GlobalController(),
    ),
    ChangeNotifierProvider<CartController>(
      create: (context) => CartController(),
    ),
    ChangeNotifierProvider<UserController>(
      create: (context) => UserController(),
    ),
    ChangeNotifierProvider<InternetController>(
      create: (context) => InternetController(),
    )
  ];
}
