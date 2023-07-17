import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../screens/authentication_pages/admin_authentication_page.dart';
import '../screens/landing_page/landing_page.dart';






/// The route configuration.

class Routes {

  static const String adminAuthenticationPage = "/adminAuthentication";
  static const String landingPage = "/";

  static GoRouter buildRouter() {
    return GoRouter(
      initialLocation: landingPage,
      routes: _buildRoutes(),
    );
  }

  static List<RouteBase> _buildRoutes() {
    return [

      GoRoute(
        name: 'landing_page',
        path: landingPage,
        builder: (BuildContext context, GoRouterState state) {
          // Return the widget for the landing page
          return const LandingPage();
        },
      ),

     GoRoute(
       name: 'adminAuthPage',
      path: adminAuthenticationPage,
      builder: (BuildContext context, GoRouterState state) {
        return const AdminAuthenticationPage();
      },
    ),


    ];
  }

  static GoRoute _buildRootRoute() {
    return GoRoute(
      path: landingPage,
      builder: (BuildContext context, GoRouterState state) {
        return const LandingPage();
      },
      routes: [
        _buildDetailsRoute(),
      ],
    );
  }

  static GoRoute _buildDetailsRoute() {
    return GoRoute(
      path: adminAuthenticationPage,
      builder: (BuildContext context, GoRouterState state) {
        return const AdminAuthenticationPage();
      },
    );
  }

  static GoRoute _buildDetailszRoute() {
    return GoRoute(
      path: 'details',
      builder: (BuildContext context, GoRouterState state) {
        return const AdminAuthenticationPage();
      },
    );
  }
}

