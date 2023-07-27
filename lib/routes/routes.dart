import 'package:classpass/screens/image_cropper_page/image_cropper_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../screens/admin_registration_pages/admin_register_page.dart';
import '../screens/admin_registration_pages/admin_register_selection.dart';
import '../screens/authentication_pages/admin_authentication_page.dart';

import '../screens/camera_page/camera_page.dart';
import '../screens/landing_page/landing_page.dart';







/// The route configuration.

class Routes {

  static const String adminAuthenticationPage = "/adminAuthentication";
  static const String registerSelectionPage = "/registerSelection";
  static const String registerAccountPage = "/registerAccount";
  static const String imageCropperPage = "/imageCropper";
  static const String userImagePage = "/userImage";

  static const String cameraPage = "/camera";

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

      GoRoute(
        name: 'registerSelectionPage',
        path: registerSelectionPage,
        builder: (BuildContext context, GoRouterState state) {
          return  TutorSelectionScreen();
        },
      ),

      GoRoute(
        name: 'registerAccountPage',
        path: registerAccountPage,
        builder: (BuildContext context, GoRouterState state) {
          return  const AdminRegisterPage();
        },
      ),

      GoRoute(
        name: 'imageCropperPage',
        path: imageCropperPage,
        builder: (BuildContext context, GoRouterState state) {
          return  ImageCropperPage(
            capturedImagePath: state.queryParameters['id1']!
          );
        },
      ),

      GoRoute(
        name: 'cameraPage',
        path: cameraPage,
        builder: (BuildContext context, GoRouterState state) {
          return  const CameraPage();
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

