import 'package:banmeshi_flutter/gen/proto/food.pb.dart';
import 'package:banmeshi_flutter/gen/proto/ingredient.pb.dart';
import 'package:banmeshi_flutter/model/inventory_controller.dart';
import 'package:banmeshi_flutter/model/recipe_controller.dart';
import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:banmeshi_flutter/repository/recipe_repository.dart';
import 'package:banmeshi_flutter/routes/app_router.dart';
import 'package:banmeshi_flutter/widget/ingredient_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipePage extends HookConsumerWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientCount = useState(1);
    final inventory = ref.watch(inventoryProvider.select((v) => v.ingredients));

    ingredientList() => List.generate(ingredientCount.value,
        (index) => ref.read(recipeControllerProvider(index)));

    useEffect(() {
      ref.read(inventoryProvider.notifier).fetch();
      return;
    }, const []);

    final titleController = useTextEditingController();
    final servingController = useTextEditingController();
    final urlController = useTextEditingController();

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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 7,
                          child: TextField(
                            controller: titleController,
                            decoration: const InputDecoration(hintText: 'カレー'),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 8),
                            child: TextField(
                              controller: servingController,
                              decoration: const InputDecoration(hintText: '2'),
                            ),
                          ),
                        ),
                        const Flexible(
                          child: Text('人前'),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: urlController,
                        decoration: const InputDecoration(hintText: '参考URL'),
                      ),
                    ),
                    DragTarget<Ingredient>(
                      builder: (context, candidateData, rejectedData) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              ...List.generate(
                                ingredientCount.value,
                                (index) => IngredientForm(index),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: IconButton(
                                  onPressed: () {
                                    ingredientCount.value++;
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      // 新しい食材だけ追加する
                      onWillAccept: (data) => ingredientList().every(
                          (state) => state.ingredient.name != data?.name),
                      onAccept: (data) {
                        ingredientCount.value++;

                        final lastIndex = ingredientCount.value - 1;
                        final ingredient = Ingredient()
                          ..name = data.name
                          ..amount = data.amount;

                        ref
                            .read(recipeControllerProvider(lastIndex).notifier)
                            .update(ingredient);
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
                            final isUsedIngredient = ingredientList()
                                .map((e) => e.ingredient)
                                .contains(row);

                            final card = Opacity(
                              opacity: isUsedIngredient ? .5 : 1,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text('${row.name}: ${row.amount}'),
                                ),
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
                      onPressed: () async {
                        final ingredient =
                            ingredientList().map((e) => e.ingredient);

                        final user = ref.read(userProvider);
                        if (user == null) return;

                        final food = Food(
                          ingredient: ingredient,
                          name: titleController.text,
                          serving: int.parse(servingController.text),
                          referenceUrl: urlController.text,
                        );

                        await ref
                            .read(recipeRepositoryProvider)
                            .registerRecipe(user, food);

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
