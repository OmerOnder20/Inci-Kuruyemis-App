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
    AnaSayfaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnaSayfaView(),
      );
    },
    AramaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AramaView(),
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
    EmptySepetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmptySepetView(),
      );
    },
    EmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmptyView(),
      );
    },
    HaveAccRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HaveAccView(),
      );
    },
    InitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitView(),
      );
    },
    KampanyaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const KampanyaView(),
      );
    },
    KargoTeslimatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const KargoTeslimatView(),
      );
    },
    KategoriRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<KategoriRouteArgs>(
          orElse: () => KategoriRouteArgs(
                categoryName: pathParams.getString('categoryName'),
                categoryId: pathParams.getInt('categoryId'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: KategoriView(
          key: args.key,
          categoryName: args.categoryName,
          categoryId: args.categoryId,
        ),
      );
    },
    OdemeSecenekleriRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OdemeSecenekleriView(),
      );
    },
    ProfilDetayRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilDetayView(),
      );
    },
    ProfilInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilInfoView(),
      );
    },
    ProfilRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilView(),
      );
    },
    SatinAlmaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SatinAlmaView(),
      );
    },
    SepetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SepetView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
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

/// generated route for
/// [EmptySepetView]
class EmptySepetRoute extends PageRouteInfo<void> {
  const EmptySepetRoute({List<PageRouteInfo>? children})
      : super(
          EmptySepetRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptySepetRoute';

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
/// [HaveAccView]
class HaveAccRoute extends PageRouteInfo<void> {
  const HaveAccRoute({List<PageRouteInfo>? children})
      : super(
          HaveAccRoute.name,
          initialChildren: children,
        );

  static const String name = 'HaveAccRoute';

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
/// [KategoriView]
class KategoriRoute extends PageRouteInfo<KategoriRouteArgs> {
  KategoriRoute({
    Key? key,
    required String categoryName,
    required int categoryId,
    List<PageRouteInfo>? children,
  }) : super(
          KategoriRoute.name,
          args: KategoriRouteArgs(
            key: key,
            categoryName: categoryName,
            categoryId: categoryId,
          ),
          rawPathParams: {
            'categoryName': categoryName,
            'categoryId': categoryId,
          },
          initialChildren: children,
        );

  static const String name = 'KategoriRoute';

  static const PageInfo<KategoriRouteArgs> page =
      PageInfo<KategoriRouteArgs>(name);
}

class KategoriRouteArgs {
  const KategoriRouteArgs({
    this.key,
    required this.categoryName,
    required this.categoryId,
  });

  final Key? key;

  final String categoryName;

  final int categoryId;

  @override
  String toString() {
    return 'KategoriRouteArgs{key: $key, categoryName: $categoryName, categoryId: $categoryId}';
  }
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
/// [ProfilInfoView]
class ProfilInfoRoute extends PageRouteInfo<void> {
  const ProfilInfoRoute({List<PageRouteInfo>? children})
      : super(
          ProfilInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [SatinAlmaView]
class SatinAlmaRoute extends PageRouteInfo<void> {
  const SatinAlmaRoute({List<PageRouteInfo>? children})
      : super(
          SatinAlmaRoute.name,
          initialChildren: children,
        );

  static const String name = 'SatinAlmaRoute';

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
