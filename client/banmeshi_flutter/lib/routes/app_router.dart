import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:banmeshi_flutter/pages/home_page.dart';
import 'package:banmeshi_flutter/pages/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider(
  (ref) {
    final user = ref.watch(userProvider);

    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        )
      ],
      redirect: (context, state) {
        if (user == null) {
          return '/login';
        }

        return null;
      },
    );
  },
);
