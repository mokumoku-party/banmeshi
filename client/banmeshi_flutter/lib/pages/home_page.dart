import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:banmeshi_flutter/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rowList = [
  ['にんじん', '3', 'きのう'],
  ['ぶたにく', '150', 'おととい'],
  ['たまねぎ', '10', 'きょう'],
];

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    const foodName = 'カレー';
    final titleList = ['食材', '数量', '買った日'];

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('今日のこんだて: $foodName'),
            DataTable(
              columns: titleList
                  .map((title) =>
                      DataColumn(label: Flexible(child: Text(title))))
                  .toList(),
              rows: rowList
                  .map((row) => DataRow(
                        cells: row.map((data) => DataCell(Text(data))).toList(),
                      ))
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
