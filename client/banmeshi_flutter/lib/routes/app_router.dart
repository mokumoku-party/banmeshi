import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:banmeshi_flutter/pages/home_page.dart';
import 'package:banmeshi_flutter/pages/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        redirect: (context, state) {
          final user = ref.read(userProvider);
          if (user == null) {
            return '/login';
          }

          return null;
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      )
    ],
  ),
);
