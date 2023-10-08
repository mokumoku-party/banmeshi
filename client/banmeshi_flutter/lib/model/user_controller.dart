import 'package:banmeshi_flutter/gen/proto/user.pb.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider =
    StateNotifierProvider<UserController, User?>((ref) => UserController());

class UserController extends StateNotifier<User?> {
  UserController() : super(null);

  void create(String name) {
    state = User()..name = name;
    Hive.box<String>('user').put('name', name);
  }

  void fetch() {
    final localName = Hive.box<String>('user').get('name');
    if (localName == null) return;

    state = User()..name = localName;
  }
}
