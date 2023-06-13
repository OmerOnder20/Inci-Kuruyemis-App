// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ProfilRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilView(),
      );
    },
    UrunDetayRoute.name: (routeData) {
      final args = routeData.argsAs<UrunDetayRouteArgs>(
          orElse: () => const UrunDetayRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UrunDetayView(key: args.key),
      );
    },
    KampanyaDetayRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const KampanyaDetayView(),
      );
    },
    SepetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SepetView(),
      );
    },
    UrunOzelliklerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UrunOzelliklerView(),
      );
    },
    InitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitView(),
      );
    },
    ProfilDetayRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilDetayView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    KategoriRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const KategoriView(),
      );
    },
    OdemeSecenekleriRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OdemeSecenekleriView(),
      );
    },
    AramaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AramaView(),
      );
    },
    KargoTeslimatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const KargoTeslimatView(),
      );
    },
    KampanyaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const KampanyaView(),
      );
    },
    AnaSayfaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnaSayfaView(),
      );
    },
    EmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmptyView(),
      );
    },
    EmptyKampanyaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmptyKampanyaView(),
      );
    },
    EmptyProfilRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmptyProfilView(),
      );
    },
  };
}

/// generated route for
/// [ProfilView]
class ProfilRoute extends PageRouteInfo<void> {
  const ProfilRoute({List<PageRouteInfo>? children})
      : super(
          ProfilRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UrunDetayView]
class UrunDetayRoute extends PageRouteInfo<UrunDetayRouteArgs> {
  UrunDetayRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UrunDetayRoute.name,
          args: UrunDetayRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UrunDetayRoute';

  static const PageInfo<UrunDetayRouteArgs> page =
      PageInfo<UrunDetayRouteArgs>(name);
}

class UrunDetayRouteArgs {
  const UrunDetayRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'UrunDetayRouteArgs{key: $key}';
  }
}

/// generated route for
/// [KampanyaDetayView]
class KampanyaDetayRoute extends PageRouteInfo<void> {
  const KampanyaDetayRoute({List<PageRouteInfo>? children})
      : super(
          KampanyaDetayRoute.name,
          initialChildren: children,
        );

  static const String name = 'KampanyaDetayRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SepetView]
class SepetRoute extends PageRouteInfo<void> {
  const SepetRoute({List<PageRouteInfo>? children})
      : super(
          SepetRoute.name,
          initialChildren: children,
        );

  static const String name = 'SepetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UrunOzelliklerView]
class UrunOzelliklerRoute extends PageRouteInfo<void> {
  const UrunOzelliklerRoute({List<PageRouteInfo>? children})
      : super(
          UrunOzelliklerRoute.name,
          initialChildren: children,
        );

  static const String name = 'UrunOzelliklerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InitView]
class InitRoute extends PageRouteInfo<void> {
  const InitRoute({List<PageRouteInfo>? children})
      : super(
          InitRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilDetayView]
class ProfilDetayRoute extends PageRouteInfo<void> {
  const ProfilDetayRoute({List<PageRouteInfo>? children})
      : super(
          ProfilDetayRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilDetayRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [KategoriView]
class KategoriRoute extends PageRouteInfo<void> {
  const KategoriRoute({List<PageRouteInfo>? children})
      : super(
          KategoriRoute.name,
          initialChildren: children,
        );

  static const String name = 'KategoriRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OdemeSecenekleriView]
class OdemeSecenekleriRoute extends PageRouteInfo<void> {
  const OdemeSecenekleriRoute({List<PageRouteInfo>? children})
      : super(
          OdemeSecenekleriRoute.name,
          initialChildren: children,
        );

  static const String name = 'OdemeSecenekleriRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AramaView]
class AramaRoute extends PageRouteInfo<void> {
  const AramaRoute({List<PageRouteInfo>? children})
      : super(
          AramaRoute.name,
          initialChildren: children,
        );

  static const String name = 'AramaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [KargoTeslimatView]
class KargoTeslimatRoute extends PageRouteInfo<void> {
  const KargoTeslimatRoute({List<PageRouteInfo>? children})
      : super(
          KargoTeslimatRoute.name,
          initialChildren: children,
        );

  static const String name = 'KargoTeslimatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [KampanyaView]
class KampanyaRoute extends PageRouteInfo<void> {
  const KampanyaRoute({List<PageRouteInfo>? children})
      : super(
          KampanyaRoute.name,
          initialChildren: children,
        );

  static const String name = 'KampanyaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AnaSayfaView]
class AnaSayfaRoute extends PageRouteInfo<void> {
  const AnaSayfaRoute({List<PageRouteInfo>? children})
      : super(
          AnaSayfaRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnaSayfaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyView]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyKampanyaView]
class EmptyKampanyaRoute extends PageRouteInfo<void> {
  const EmptyKampanyaRoute({List<PageRouteInfo>? children})
      : super(
          EmptyKampanyaRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyKampanyaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyProfilView]
class EmptyProfilRoute extends PageRouteInfo<void> {
  const EmptyProfilRoute({List<PageRouteInfo>? children})
      : super(
          EmptyProfilRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyProfilRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
