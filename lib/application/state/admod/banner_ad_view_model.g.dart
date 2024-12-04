// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_ad_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bannerAdViewModelHash() => r'698b7b772b3b35385dbc36dc64da188f076f8eac';

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

abstract class _$BannerAdViewModel
    extends BuildlessAutoDisposeNotifier<BannerAdState> {
  late final BuildContext context;

  BannerAdState build(
    BuildContext context,
  );
}

/// See also [BannerAdViewModel].
@ProviderFor(BannerAdViewModel)
const bannerAdViewModelProvider = BannerAdViewModelFamily();

/// See also [BannerAdViewModel].
class BannerAdViewModelFamily extends Family<BannerAdState> {
  /// See also [BannerAdViewModel].
  const BannerAdViewModelFamily();

  /// See also [BannerAdViewModel].
  BannerAdViewModelProvider call(
    BuildContext context,
  ) {
    return BannerAdViewModelProvider(
      context,
    );
  }

  @override
  BannerAdViewModelProvider getProviderOverride(
    covariant BannerAdViewModelProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'bannerAdViewModelProvider';
}

/// See also [BannerAdViewModel].
class BannerAdViewModelProvider
    extends AutoDisposeNotifierProviderImpl<BannerAdViewModel, BannerAdState> {
  /// See also [BannerAdViewModel].
  BannerAdViewModelProvider(
    BuildContext context,
  ) : this._internal(
          () => BannerAdViewModel()..context = context,
          from: bannerAdViewModelProvider,
          name: r'bannerAdViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bannerAdViewModelHash,
          dependencies: BannerAdViewModelFamily._dependencies,
          allTransitiveDependencies:
              BannerAdViewModelFamily._allTransitiveDependencies,
          context: context,
        );

  BannerAdViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  BannerAdState runNotifierBuild(
    covariant BannerAdViewModel notifier,
  ) {
    return notifier.build(
      context,
    );
  }

  @override
  Override overrideWith(BannerAdViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: BannerAdViewModelProvider._internal(
        () => create()..context = context,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BannerAdViewModel, BannerAdState>
      createElement() {
    return _BannerAdViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BannerAdViewModelProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BannerAdViewModelRef on AutoDisposeNotifierProviderRef<BannerAdState> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _BannerAdViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<BannerAdViewModel, BannerAdState>
    with BannerAdViewModelRef {
  _BannerAdViewModelProviderElement(super.provider);

  @override
  BuildContext get context => (origin as BannerAdViewModelProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
