import 'package:banmeshi_flutter/gen/proto/service/inventory_service.pbgrpc.dart';
import 'package:banmeshi_flutter/gen/proto/user.pb.dart';
import 'package:banmeshi_flutter/provider/grpc_channel_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final inventoryServiceProvider =
    Provider((ref) => InventoryServiceClient(ref.read(grpcChannelProvider)));

final inventoryRepositoryProvider = Provider((ref) => InventoryRepository(ref));

class InventoryRepository {
  final Ref _ref;

  const InventoryRepository(this._ref);

  InventoryServiceClient get client => _ref.read(inventoryServiceProvider);

  Future<Inventory> fetchInventory(User user) async =>
      client.fetchInventory(user);

  Future<void> addInventory(User user, Item item) async =>
      client.addInventory(item);
}
