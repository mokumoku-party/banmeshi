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
    print(inventory);

    useEffect(() {
      ref.read(inventoryProvider.notifier).fetch();
      return;
    }, [user]);

    const foodName = 'カレー';
    final titleList = ['食材', '数量', '買った日'];

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('${user?.name ?? '今日'}のこんだて: $foodName'),
            DataTable(
              columns: titleList
                  .map((title) =>
                      DataColumn(label: Flexible(child: Text(title))))
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    ref.read(appRouterProvider).go('/register');
                  },
                  child: const Text('買った'),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(appRouterProvider).go('/recipe');
                  },
                  child: const Text('作った'),
                ),
                TextButton(
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
