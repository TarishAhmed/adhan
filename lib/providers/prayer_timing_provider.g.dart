// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_timing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$prayerTimingHash() => r'09d77f00638f3616cee82a0290709bd9d173a813';

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

/// See also [prayerTiming].
@ProviderFor(prayerTiming)
const prayerTimingProvider = PrayerTimingFamily();

/// See also [prayerTiming].
class PrayerTimingFamily extends Family<AsyncValue<PrayerTimeResponseModel>> {
  /// See also [prayerTiming].
  const PrayerTimingFamily();

  /// See also [prayerTiming].
  PrayerTimingProvider call({
    int method = 1,
    int school = 0,
    int latitudeAdjustmentMethod = 0,
  }) {
    return PrayerTimingProvider(
      method: method,
      school: school,
      latitudeAdjustmentMethod: latitudeAdjustmentMethod,
    );
  }

  @override
  PrayerTimingProvider getProviderOverride(
    covariant PrayerTimingProvider provider,
  ) {
    return call(
      method: provider.method,
      school: provider.school,
      latitudeAdjustmentMethod: provider.latitudeAdjustmentMethod,
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
  String? get name => r'prayerTimingProvider';
}

/// See also [prayerTiming].
class PrayerTimingProvider extends FutureProvider<PrayerTimeResponseModel> {
  /// See also [prayerTiming].
  PrayerTimingProvider({
    int method = 1,
    int school = 0,
    int latitudeAdjustmentMethod = 0,
  }) : this._internal(
         (ref) => prayerTiming(
           ref as PrayerTimingRef,
           method: method,
           school: school,
           latitudeAdjustmentMethod: latitudeAdjustmentMethod,
         ),
         from: prayerTimingProvider,
         name: r'prayerTimingProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$prayerTimingHash,
         dependencies: PrayerTimingFamily._dependencies,
         allTransitiveDependencies:
             PrayerTimingFamily._allTransitiveDependencies,
         method: method,
         school: school,
         latitudeAdjustmentMethod: latitudeAdjustmentMethod,
       );

  PrayerTimingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.method,
    required this.school,
    required this.latitudeAdjustmentMethod,
  }) : super.internal();

  final int method;
  final int school;
  final int latitudeAdjustmentMethod;

  @override
  Override overrideWith(
    FutureOr<PrayerTimeResponseModel> Function(PrayerTimingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PrayerTimingProvider._internal(
        (ref) => create(ref as PrayerTimingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        method: method,
        school: school,
        latitudeAdjustmentMethod: latitudeAdjustmentMethod,
      ),
    );
  }

  @override
  FutureProviderElement<PrayerTimeResponseModel> createElement() {
    return _PrayerTimingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PrayerTimingProvider &&
        other.method == method &&
        other.school == school &&
        other.latitudeAdjustmentMethod == latitudeAdjustmentMethod;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, method.hashCode);
    hash = _SystemHash.combine(hash, school.hashCode);
    hash = _SystemHash.combine(hash, latitudeAdjustmentMethod.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PrayerTimingRef on FutureProviderRef<PrayerTimeResponseModel> {
  /// The parameter `method` of this provider.
  int get method;

  /// The parameter `school` of this provider.
  int get school;

  /// The parameter `latitudeAdjustmentMethod` of this provider.
  int get latitudeAdjustmentMethod;
}

class _PrayerTimingProviderElement
    extends FutureProviderElement<PrayerTimeResponseModel>
    with PrayerTimingRef {
  _PrayerTimingProviderElement(super.provider);

  @override
  int get method => (origin as PrayerTimingProvider).method;
  @override
  int get school => (origin as PrayerTimingProvider).school;
  @override
  int get latitudeAdjustmentMethod =>
      (origin as PrayerTimingProvider).latitudeAdjustmentMethod;
}

String _$currentRelevantPrayerHash() =>
    r'22db8937a1a82e8902b1eaf9c059236461cdf8f2';

/// See also [currentRelevantPrayer].
@ProviderFor(currentRelevantPrayer)
final currentRelevantPrayerProvider =
    AutoDisposeStreamProvider<PrayerTimeWithOffset>.internal(
      currentRelevantPrayer,
      name: r'currentRelevantPrayerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentRelevantPrayerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentRelevantPrayerRef =
    AutoDisposeStreamProviderRef<PrayerTimeWithOffset>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
