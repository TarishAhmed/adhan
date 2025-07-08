// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_timing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(prayerTiming)
const prayerTimingProvider = PrayerTimingFamily._();

final class PrayerTimingProvider
    extends
        $FunctionalProvider<
          AsyncValue<PrayerTimeResponseModel>,
          PrayerTimeResponseModel,
          FutureOr<PrayerTimeResponseModel>
        >
    with
        $FutureModifier<PrayerTimeResponseModel>,
        $FutureProvider<PrayerTimeResponseModel> {
  const PrayerTimingProvider._({
    required PrayerTimingFamily super.from,
    required ({int method, int school, int latitudeAdjustmentMethod})
    super.argument,
  }) : super(
         retry: null,
         name: r'prayerTimingProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prayerTimingHash();

  @override
  String toString() {
    return r'prayerTimingProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PrayerTimeResponseModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PrayerTimeResponseModel> create(Ref ref) {
    final argument =
        this.argument
            as ({int method, int school, int latitudeAdjustmentMethod});
    return prayerTiming(
      ref,
      method: argument.method,
      school: argument.school,
      latitudeAdjustmentMethod: argument.latitudeAdjustmentMethod,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PrayerTimingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$prayerTimingHash() => r'09d77f00638f3616cee82a0290709bd9d173a813';

final class PrayerTimingFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PrayerTimeResponseModel>,
          ({int method, int school, int latitudeAdjustmentMethod})
        > {
  const PrayerTimingFamily._()
    : super(
        retry: null,
        name: r'prayerTimingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PrayerTimingProvider call({
    int method = 1,
    int school = 0,
    int latitudeAdjustmentMethod = 0,
  }) => PrayerTimingProvider._(
    argument: (
      method: method,
      school: school,
      latitudeAdjustmentMethod: latitudeAdjustmentMethod,
    ),
    from: this,
  );

  @override
  String toString() => r'prayerTimingProvider';
}

@ProviderFor(prayerTimingMonth)
const prayerTimingMonthProvider = PrayerTimingMonthFamily._();

final class PrayerTimingMonthProvider
    extends
        $FunctionalProvider<
          AsyncValue<PrayerTimingMonthResponseModel>,
          PrayerTimingMonthResponseModel,
          FutureOr<PrayerTimingMonthResponseModel>
        >
    with
        $FutureModifier<PrayerTimingMonthResponseModel>,
        $FutureProvider<PrayerTimingMonthResponseModel> {
  const PrayerTimingMonthProvider._({
    required PrayerTimingMonthFamily super.from,
    required ({int method, int school, int latitudeAdjustmentMethod})
    super.argument,
  }) : super(
         retry: null,
         name: r'prayerTimingMonthProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prayerTimingMonthHash();

  @override
  String toString() {
    return r'prayerTimingMonthProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<PrayerTimingMonthResponseModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PrayerTimingMonthResponseModel> create(Ref ref) {
    final argument =
        this.argument
            as ({int method, int school, int latitudeAdjustmentMethod});
    return prayerTimingMonth(
      ref,
      method: argument.method,
      school: argument.school,
      latitudeAdjustmentMethod: argument.latitudeAdjustmentMethod,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PrayerTimingMonthProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$prayerTimingMonthHash() => r'26cac8aad66f220095a88164ec5b1fcf26a22acb';

final class PrayerTimingMonthFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PrayerTimingMonthResponseModel>,
          ({int method, int school, int latitudeAdjustmentMethod})
        > {
  const PrayerTimingMonthFamily._()
    : super(
        retry: null,
        name: r'prayerTimingMonthProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PrayerTimingMonthProvider call({
    int method = 1,
    int school = 0,
    int latitudeAdjustmentMethod = 0,
  }) => PrayerTimingMonthProvider._(
    argument: (
      method: method,
      school: school,
      latitudeAdjustmentMethod: latitudeAdjustmentMethod,
    ),
    from: this,
  );

  @override
  String toString() => r'prayerTimingMonthProvider';
}

@ProviderFor(currentRelevantPrayer)
const currentRelevantPrayerProvider = CurrentRelevantPrayerProvider._();

final class CurrentRelevantPrayerProvider
    extends
        $FunctionalProvider<
          AsyncValue<PrayerTimeWithOffset>,
          PrayerTimeWithOffset,
          Stream<PrayerTimeWithOffset>
        >
    with
        $FutureModifier<PrayerTimeWithOffset>,
        $StreamProvider<PrayerTimeWithOffset> {
  const CurrentRelevantPrayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentRelevantPrayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentRelevantPrayerHash();

  @$internal
  @override
  $StreamProviderElement<PrayerTimeWithOffset> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PrayerTimeWithOffset> create(Ref ref) {
    return currentRelevantPrayer(ref);
  }
}

String _$currentRelevantPrayerHash() =>
    r'22db8937a1a82e8902b1eaf9c059236461cdf8f2';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
