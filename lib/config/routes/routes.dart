import 'package:api_with_bloc/config/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  static const String _splashPage = '/splash_page';
  static const String _caregiverPage = '/caregiver_page';
  static const String _seniorPage = '/senior_page';

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, initial: true, path: _splashPage),
        AutoRoute(page: CaregiverRoute.page, path: _caregiverPage),
        AutoRoute(page: SeniorRoute.page, path: _seniorPage),
        
      ];
}
