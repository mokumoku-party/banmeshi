import 'package:banmeshi_flutter/gen/proto/user.pb.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider =
    StateNotifierProvider<UserController, User?>((ref) => UserController());

class UserController extends StateNotifier<User?> {
  final Box<String> box;
  UserController()
      : box = Hive.box<String>('user'),
        super(null);

  void login() {
    final localName = box.get('name');
    if (localName == null) return;

    state = User()..name = localName;
  }

  void logout() {
    box.delete('name');
    state = null;
  }

  void register(String name) {
    state = User()..name = name;
    box.put('name', name);
  }
}
