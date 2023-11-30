import 'package:banmeshi_flutter/provider/grpc_channel_provider.dart';
import 'package:banmeshi_flutter/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('user');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    ref.watch(grpcChannelProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 220, 95, 6)),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
