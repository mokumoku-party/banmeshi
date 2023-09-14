import 'package:banmeshi_flutter/gen/proto/service/inventory_service.pb.dart';
import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:banmeshi_flutter/repository/inventory_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final inventoryProvider = StateNotifierProvider<InventoryController, Inventory>(
    (ref) => InventoryController(ref));

class InventoryController extends StateNotifier<Inventory> {
  final Ref _ref;

  InventoryController(this._ref) : super(Inventory());

  Future<void> fetch() async {
    final user = _ref.read(userProvider);
    if (user == null) return;

    state = await _ref.read(inventoryRepositoryProvider).fetchInventory(user);
  }
}
