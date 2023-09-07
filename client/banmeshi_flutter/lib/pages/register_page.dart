import 'package:banmeshi_flutter/model/inventory_controller.dart';
import 'package:banmeshi_flutter/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(inventoryProvider.select((v) => v.ingredients));

    useEffect(() {
      ref.read(inventoryProvider.notifier).fetch();
      return;
    }, const []);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('ざいこ'),
              ),
              Flexible(
                child: ListView(
                  children: inventory
                      .map(
                        (row) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('${row.name}: ${row.amount}'),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              TextButton(
                onPressed: () {
                  ref.read(appRouterProvider).go('/');
                },
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('完成'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
