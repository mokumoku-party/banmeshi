import 'package:banmeshi_flutter/pages/home_page.dart';
import 'package:banmeshi_flutter/routes/app_router.dart';
import 'package:banmeshi_flutter/widget/ingredient_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipePage extends HookConsumerWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forms = useState([
      const IngredientForm(),
      const IngredientForm(),
    ]);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: DragTarget<List<String>>(
                  builder: (context, candidateData, rejectedData) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        ...forms.value,
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: IconButton(
                            onPressed: () {
                              forms.value = [
                                ...forms.value,
                                const IngredientForm(),
                              ];
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    );
                  },
                  // 新しい食材だけ追加する
                  onWillAccept: (data) =>
                      forms.value.every((form) => form.name != data?[0]),
                  onAccept: (data) {
                    forms.value = [
                      IngredientForm(
                        name: data[0],
                        amount: int.parse(
                          data[1],
                        ),
                      ),
                      ...forms.value,
                    ];
                  },
                ),
              ),
              Flexible(
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
                        children: rowList.map(
                          (row) {
                            final card = Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text('${row.name}: ${row.amount}'),
                              ),
                            );
                            return Draggable(
                              data: row,
                              feedback: Opacity(opacity: .5, child: card),
                              child: card,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.read(appRouterProvider).go('/');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('更新'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
