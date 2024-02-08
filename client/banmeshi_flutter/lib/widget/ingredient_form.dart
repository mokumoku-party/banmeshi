import 'package:banmeshi_flutter/gen/proto/ingredient.pb.dart';
import 'package:banmeshi_flutter/model/recipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IngredientForm extends HookConsumerWidget {
  final int index;
  final Ingredient? initIngredient;

  const IngredientForm(this.index, {this.initIngredient, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameCtrl = useTextEditingController(text: initIngredient?.name);
    final amountCtrl = useTextEditingController(text: '');
    final isValidForm =
        ref.watch(recipeControllerProvider(index).select((v) => v.isValid));

    final colorScheme = Theme.of(context).colorScheme;

    useEffect(() {
      update() async {
        ref.read(recipeControllerProvider(index).notifier)
          ..changeName(nameCtrl.text)
          ..changeAmount(double.tryParse(amountCtrl.text));
      }

      nameCtrl.addListener(update);
      amountCtrl.addListener(update);
      Future.microtask(update);

      return () {
        nameCtrl.removeListener(update);
        amountCtrl.removeListener(update);
      };
    }, const []);

    final border = RoundedRectangleBorder(
      side: BorderSide(color: colorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    );

    return SizedBox(
      width: 640,
      child: Card(
        color: isValidForm ? colorScheme.tertiaryContainer : null,
        shape: isValidForm ? border : null,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 7,
                child: TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(hintText: 'にんじん'),
                ),
              ),
              const SizedBox(width: 32),
              Flexible(
                flex: 3,
                child: TextField(
                  controller: amountCtrl,
                  decoration: const InputDecoration(hintText: '3'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
