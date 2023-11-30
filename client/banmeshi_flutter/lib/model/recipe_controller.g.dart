// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeControllerHash() => r'0e4288e8ea8f9b3eca8ce0bdef92d909fc1f01a5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$RecipeController
    extends BuildlessAutoDisposeNotifier<RecipeState> {
  late final int index;
  late final Ingredient? ingredient;

  RecipeState build(
    int index, {
    Ingredient? ingredient,
  });
}

/// See also [RecipeController].
@ProviderFor(RecipeController)
const recipeControllerProvider = RecipeControllerFamily();

/// See also [RecipeController].
class RecipeControllerFamily extends Family<RecipeState> {
  /// See also [RecipeController].
  const RecipeControllerFamily();

  /// See also [RecipeController].
  RecipeControllerProvider call(
    int index, {
    Ingredient? ingredient,
  }) {
    return RecipeControllerProvider(
      index,
      ingredient: ingredient,
    );
  }

  @override
  RecipeControllerProvider getProviderOverride(
    covariant RecipeControllerProvider provider,
  ) {
    return call(
      provider.index,
      ingredient: provider.ingredient,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeControllerProvider';
}

/// See also [RecipeController].
class RecipeControllerProvider
    extends AutoDisposeNotifierProviderImpl<RecipeController, RecipeState> {
  /// See also [RecipeController].
  RecipeControllerProvider(
    int index, {
    Ingredient? ingredient,
  }) : this._internal(
          () => RecipeController()
            ..index = index
            ..ingredient = ingredient,
          from: recipeControllerProvider,
          name: r'recipeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeControllerHash,
          dependencies: RecipeControllerFamily._dependencies,
          allTransitiveDependencies:
              RecipeControllerFamily._allTransitiveDependencies,
          index: index,
          ingredient: ingredient,
        );

  RecipeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
    required this.ingredient,
  }) : super.internal();

  final int index;
  final Ingredient? ingredient;

  @override
  RecipeState runNotifierBuild(
    covariant RecipeController notifier,
  ) {
    return notifier.build(
      index,
      ingredient: ingredient,
    );
  }

  @override
  Override overrideWith(RecipeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeControllerProvider._internal(
        () => create()
          ..index = index
          ..ingredient = ingredient,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
        ingredient: ingredient,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<RecipeController, RecipeState>
      createElement() {
    return _RecipeControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeControllerProvider &&
        other.index == index &&
        other.ingredient == ingredient;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);
    hash = _SystemHash.combine(hash, ingredient.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecipeControllerRef on AutoDisposeNotifierProviderRef<RecipeState> {
  /// The parameter `index` of this provider.
  int get index;

  /// The parameter `ingredient` of this provider.
  Ingredient? get ingredient;
}

class _RecipeControllerProviderElement
    extends AutoDisposeNotifierProviderElement<RecipeController, RecipeState>
    with RecipeControllerRef {
  _RecipeControllerProviderElement(super.provider);

  @override
  int get index => (origin as RecipeControllerProvider).index;
  @override
  Ingredient? get ingredient => (origin as RecipeControllerProvider).ingredient;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
