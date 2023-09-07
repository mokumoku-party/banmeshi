import 'package:banmeshi_flutter/gen/proto/ingredient.pb.dart';
import 'package:banmeshi_flutter/model/inventory_controller.dart';
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
    ]);

    final inventory = ref.watch(inventoryProvider.select((v) => v.ingredients));

    useEffect(() {
      ref.read(inventoryProvider.notifier).fetch();
      return;
    }, const []);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const TextField(
                      decoration: InputDecoration(hintText: 'カレー'),
                    ),
                    DragTarget<Ingredient>(
                      builder: (context, candidateData, rejectedData) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: ListView(
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
                          ),
                        );
                      },
                      // 新しい食材だけ追加する
                      onWillAccept: (data) =>
                          forms.value.every((form) => form.name != data?.name),
                      onAccept: (data) {
                        forms.value = [
                          IngredientForm(
                            name: data.name,
                            amount: data.amount.toInt(),
                          ),
                          ...forms.value,
                        ];
                      },
                    ),
                  ],
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
                        children: inventory.map(
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
                        child: Text('完成'),
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
