import 'package:banmeshi_flutter/gen/proto/user.pb.dart';
import 'package:banmeshi_flutter/routes/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepository = Provider<UserRepository>((ref) => UserRepository(ref));

class UserRepository {
  final ProviderRef _ref;
  UserRepository(this._ref);

  Future<void> login(User user) async {
    _ref.read(appRouterProvider).go('/');
  }
}
