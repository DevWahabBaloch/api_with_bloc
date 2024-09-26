// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_with_bloc/features/auth/caregiver_signup/presentation/pages/caregiver_signup_page.dart'
    as _i1;
import 'package:api_with_bloc/features/auth/email_verify_page/presentation/pages/email_verify_page.dart'
    as _i2;
import 'package:api_with_bloc/features/auth/senior_signup/presentation/pages/senior_signup_page.dart'
    as _i5;
import 'package:api_with_bloc/features/auth/set_password/presentation/pages/set_password_page.dart'
    as _i6;
import 'package:api_with_bloc/features/senior_home_page/presentation/pages/senior_home_page.dart'
    as _i4;
import 'package:api_with_bloc/features/splash_screen/presentation/pages/splash_page.dart'
    as _i7;
import 'package:api_with_bloc/my_app.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i8;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    CaregiverRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CaregiverPage(),
      );
    },
    EmailVerifyRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EmailVerifyPage(),
      );
    },
    MyApp.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MyApp(),
      );
    },
    SeniorHomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SeniorHomePage(),
      );
    },
    SeniorRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SeniorPage(),
      );
    },
    SetPasswordRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SetPasswordPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CaregiverPage]
class CaregiverRoute extends _i8.PageRouteInfo<void> {
  const CaregiverRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CaregiverRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaregiverRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EmailVerifyPage]
class EmailVerifyRoute extends _i8.PageRouteInfo<void> {
  const EmailVerifyRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EmailVerifyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailVerifyRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MyApp]
class MyApp extends _i8.PageRouteInfo<void> {
  const MyApp({List<_i8.PageRouteInfo>? children})
      : super(
          MyApp.name,
          initialChildren: children,
        );

  static const String name = 'MyApp';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SeniorHomePage]
class SeniorHomeRoute extends _i8.PageRouteInfo<void> {
  const SeniorHomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SeniorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SeniorHomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SeniorPage]
class SeniorRoute extends _i8.PageRouteInfo<void> {
  const SeniorRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'SeniorRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SetPasswordPage]
class SetPasswordRoute extends _i8.PageRouteInfo<void> {
  const SetPasswordRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetPasswordRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
