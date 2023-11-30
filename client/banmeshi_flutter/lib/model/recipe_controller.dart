import 'package:banmeshi_flutter/gen/proto/ingredient.pb.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_controller.freezed.dart';
part 'recipe_controller.g.dart';

@freezed
abstract class RecipeState with _$RecipeState {
  RecipeState._();

  factory RecipeState({
    required Ingredient ingredient,
  }) = _RecipeState;

  late final isValid = ingredient.name.isNotEmpty && ingredient.amount > 0;
}

@riverpod
class RecipeController extends _$RecipeController {
  late int _index;

  @override
  RecipeState build(int index, {Ingredient? ingredient}) {
    _index = index;

    return RecipeState(ingredient: ingredient ?? Ingredient());
  }

  void update(Ingredient ingredient) {
    state = state.copyWith(ingredient: ingredient);
  }

  void changeName(String name) {
    state = state.copyWith(
      ingredient: state.ingredient..name = name,
    );
  }

  void changeAmount(double? amount) {
    if (amount == null) return;

    state = state.copyWith(
      ingredient: state.ingredient..amount = amount,
    );
  }
}
