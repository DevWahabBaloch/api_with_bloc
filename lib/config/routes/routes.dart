import 'package:api_with_bloc/config/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  static const String _caregiverPage = '/caregiver';
  static const String _seniorPage = '/senior';
  static const String _setPasswordPage = '/set_password';
  static const String _emailVerifyPage = '/email_verify';
  static const String _seniorHomePage = '/senior_home';

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: CaregiverRoute.page, path: _caregiverPage),
        AutoRoute(page: SeniorRoute.page, path: _seniorPage),
        AutoRoute(page: SetPasswordRoute.page, path: _setPasswordPage),
        AutoRoute(page: EmailVerifyRoute.page, path: _emailVerifyPage),
        AutoRoute(page: SeniorHomeRoute.page, path: _seniorHomePage),
      ];
}
