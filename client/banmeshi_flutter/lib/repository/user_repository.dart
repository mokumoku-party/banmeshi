import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepository = Provider<UserRepository>((ref) => UserRepository(ref));

class UserRepository {
  final ProviderRef _ref;
  UserRepository(this._ref);
}
