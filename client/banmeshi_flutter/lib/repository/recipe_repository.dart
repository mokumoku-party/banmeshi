import 'package:banmeshi_flutter/gen/proto/food.pb.dart';
import 'package:banmeshi_flutter/gen/proto/service/recipe_service.pbgrpc.dart';
import 'package:banmeshi_flutter/gen/proto/user.pb.dart';
import 'package:banmeshi_flutter/provider/grpc_channel_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recipeServiceProvider =
    Provider((ref) => RecipeServiceClient(ref.read(grpcChannelProvider)));

final recipeRepositoryProvider = Provider((ref) => RecipeRepository(ref));

class RecipeRepository {
  final Ref _ref;

  const RecipeRepository(this._ref);

  RecipeServiceClient get client => _ref.read(recipeServiceProvider);

  Future<void> registerRecipe(User user, Food food) =>
      client.registerFoodAsRecipe(
        Recipe()
          ..food = food
          ..user = user,
      );

  Future<RecommendFood> fetchRecommendRecipe(User user) =>
      client.fetchRecommendRecipe(user);
}
