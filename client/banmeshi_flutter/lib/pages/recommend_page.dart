import 'package:banmeshi_flutter/model/recommend_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecommendPage extends HookConsumerWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(recommendProvider).asData?.value;

    if (result == null) return const CircularProgressIndicator();

    final foods = result.recommendFoods;

    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (BuildContext context, int index) {
        final food = foods[index];

        return Container(
          padding: const EdgeInsets.all(32),
          child: Text(food.ingredient.join(",") + food.name),
        );
      },
    );
  }
}
