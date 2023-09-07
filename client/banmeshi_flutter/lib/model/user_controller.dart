import 'package:banmeshi_flutter/gen/proto/user.pb.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider =
    StateNotifierProvider<UserController, User?>((ref) => UserController());

class UserController extends StateNotifier<User?> {
  UserController() : super(null);

  void create(String name) {
    state = User()..name = name;
  }
}
