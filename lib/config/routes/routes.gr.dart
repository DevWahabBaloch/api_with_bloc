// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_with_bloc/features/splash_screen/presentation/auth/caregiver_signup/presentation/pages/caregiver_signup_page.dart'
    as _i1;
import 'package:api_with_bloc/features/splash_screen/presentation/auth/senior_signup/presentation/pages/senior_signup_page.dart'
    as _i3;
import 'package:api_with_bloc/features/splash_screen/presentation/pages/splash_page.dart'
    as _i4;
import 'package:api_with_bloc/my_app.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i5;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CaregiverRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CaregiverPage(),
      );
    },
    MyApp.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MyApp(),
      );
    },
    SeniorRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SeniorPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CaregiverPage]
class CaregiverRoute extends _i5.PageRouteInfo<void> {
  const CaregiverRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CaregiverRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaregiverRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MyApp]
class MyApp extends _i5.PageRouteInfo<void> {
  const MyApp({List<_i5.PageRouteInfo>? children})
      : super(
          MyApp.name,
          initialChildren: children,
        );

  static const String name = 'MyApp';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SeniorPage]
class SeniorRoute extends _i5.PageRouteInfo<void> {
  const SeniorRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'SeniorRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
