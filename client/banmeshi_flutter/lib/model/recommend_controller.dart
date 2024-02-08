import 'package:banmeshi_flutter/gen/proto/service/recipe_service.pb.dart';
import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:banmeshi_flutter/repository/recipe_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final recommendProvider = FutureProvider<RecommendFood?>(
  (ref) {
    final user = ref.watch(userProvider);
    if (user == null) return null;

    return ref.watch(recipeRepositoryProvider).fetchRecommendRecipe(user);
  },
);
