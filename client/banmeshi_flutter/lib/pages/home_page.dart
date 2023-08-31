import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    const foodName = 'カレー';
    final titleList = ['食材', '数量', '買った日'];
    final rowList = [
      ['にんじん', '3', 'きのう'],
      ['ぶたにく', '150', 'おととい'],
    ];

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
                TextButton(onPressed: () {}, child: const Text('買った')),
                TextButton(onPressed: () {}, child: const Text('作った')),
                TextButton(onPressed: () {}, child: const Text('考える')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
