import 'package:flutter/material.dart';

class IngredientForm extends StatelessWidget {
  final String name;
  final int amount;

  const IngredientForm({super.key, this.name = '', this.amount = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 640,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 7,
            child: TextField(
              controller: TextEditingController(text: name),
              decoration: const InputDecoration(hintText: 'にんじん'),
            ),
          ),
          const SizedBox(width: 32),
          Flexible(
            flex: 3,
            child: TextField(
              controller: TextEditingController(text: amount.toString()),
              decoration: const InputDecoration(hintText: '3'),
            ),
          ),
        ],
      ),
    );
  }
}
