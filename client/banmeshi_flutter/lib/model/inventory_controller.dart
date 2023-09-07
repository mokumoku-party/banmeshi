import 'package:banmeshi_flutter/gen/proto/ingredient.pb.dart';
import 'package:banmeshi_flutter/gen/proto/service/inventory_service.pb.dart';
import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:fixnum/fixnum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final inventoryProvider = StateNotifierProvider<InventoryController, Inventory>(
    (ref) => InventoryController(ref));

class InventoryController extends StateNotifier<Inventory> {
  final Ref _ref;

  InventoryController(this._ref) : super(Inventory());

  Future<void> fetch() async {
    final user = _ref.read(userProvider);
    if (user == null) return;

    // state = await _ref.read(inventoryRepositoryProvider).fetchInventory(user);

    // TODO: mock
    Future.microtask(() {
      state = Inventory()
        ..ingredients.addAll([
          Ingredient()
            ..name = 'にんじん'
            ..amount = 3
            ..registerDate = Int64(0),
          Ingredient()
            ..name = 'ぶたにく'
            ..amount = 150
            ..registerDate = Int64(1),
          Ingredient()
            ..name = 'たまねぎ'
            ..amount = 10
            ..registerDate = Int64(2),
        ]);
    });
  }
}
