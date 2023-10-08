import 'package:banmeshi_flutter/model/inventory_controller.dart';
import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:banmeshi_flutter/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final inventory = ref.watch(inventoryProvider.select((v) => v.ingredients));

    useEffect(() {
      ref.read(inventoryProvider.notifier).fetch();
      return;
    }, [user]);

    const foodName = 'カレー';
    final titleList = ['食材', '数量', '買った日'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('こんだて: $foodName'),
        actions: [
          Text(user!.name),
          TextButton(
              onPressed: () {
                ref.read(userProvider.notifier).logout();
              },
              child: const Text('ログアウト')),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            DataTable(
              columns: titleList
                  .map(
                    (title) => DataColumn(
                      label: Flexible(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              rows: inventory
                  .map(
                    (row) => DataRow(
                      cells: [
                        row.name,
                        row.amount.toString(),
                        row.registerDate.toString()
                      ].map(((data) => DataCell(Text(data)))).toList(),
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(appRouterProvider).go('/register');
                  },
                  child: const Text('買った'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    ref.read(appRouterProvider).go('/recipe');
                  },
                  child: const Text('作った'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    ref.read(appRouterProvider).go('/recommend');
                  },
                  child: const Text('考える'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
