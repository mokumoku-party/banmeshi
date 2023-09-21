import 'package:banmeshi_flutter/gen/proto/ingredient.pb.dart';
import 'package:banmeshi_flutter/model/inventory_controller.dart';
import 'package:banmeshi_flutter/routes/app_router.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);

  String _relativeDateText(DateTime dateTime) {
    final diffDays = dateTime.difference(DateTime.now()).inDays;

    return switch (diffDays) {
      (> -1 && <= 0) => '今日',
      _ => '${diffDays.abs()}日前',
    };
  }

  String _formatUnit(IngredientUnit unit) {
    return switch (unit) {
      IngredientUnit.grams => 'g',
      IngredientUnit.quantity => '個',
      _ => '個'
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(inventoryProvider.select((v) => v.ingredients));

    final nameCtrl = useTextEditingController();
    final amountCtrl = useTextEditingController();
    final unitState = useState(IngredientUnit.quantity);
    final dateCtrl = useState(DateTime.now());
    final canSendState = useState(false);

    final initInventory = [...inventory];
    final registerInventory = useState([...inventory]);

    useEffect(() {
      ref.read(inventoryProvider.notifier).fetch();

      updateCanSend() {
        canSendState.value =
            nameCtrl.text.isNotEmpty && amountCtrl.text.isNotEmpty;
      }

      nameCtrl.addListener(updateCanSend);
      amountCtrl.addListener(updateCanSend);
      dateCtrl.addListener(updateCanSend);
      return;
    }, const []);

    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('ざいこ'),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: registerInventory.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      final row = registerInventory.value[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                              '${row.name} : ${row.amount}${_formatUnit(row.unit)}   ${_relativeDateText(DateTime.fromMillisecondsSinceEpoch(row.registerDate.toInt()))}'),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 8,
                      child: TextField(
                        decoration: const InputDecoration(labelText: "食材名"),
                        controller: nameCtrl,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 3,
                      child: TextField(
                        controller: amountCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(labelText: "数量"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    DropdownButton<IngredientUnit>(
                      value: unitState.value,
                      items: IngredientUnit.values
                          .map((unit) => DropdownMenuItem(
                                value: unit,
                                child: Text(_formatUnit(unit)),
                              ))
                          .toList(),
                      onChanged: (unit) {
                        if (unit != null) {
                          unitState.value = unit;
                        }
                      },
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 3,
                      child: TextButton(
                        onPressed: () async {
                          final now = DateTime.now();
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: now.subtract(const Duration(days: 7)),
                            lastDate: now,
                          );
                          if (picked == null) return;

                          dateCtrl.value = picked;
                        },
                        child: Text(
                          _relativeDateText(dateCtrl.value),
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: canSendState.value
                      ? () {
                          final ingredient = Ingredient()
                            ..name = nameCtrl.text
                            ..amount = double.parse(amountCtrl.text)
                            ..unit = unitState.value
                            ..registerDate =
                                Int64(dateCtrl.value.millisecondsSinceEpoch);
                          registerInventory.value.add(ingredient);

                          nameCtrl.text = '';
                          amountCtrl.text = '';
                        }
                      : null,
                  child: const Padding(
                    padding: EdgeInsets.all(32),
                    child: Text('追加'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // calculate diff and post data to api
                    final diffIngredients = registerInventory.value
                        .toSet()
                        .difference(initInventory.toSet())
                        .toList();

                    for (var ingredient in diffIngredients) {
                      ref.read(inventoryProvider.notifier).add(ingredient);
                    }

                    ref.read(appRouterProvider).go('/');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('もどる'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
