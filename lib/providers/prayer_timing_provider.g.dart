// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_timing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PrayerTimeMonthNotifier)
@JsonPersist()
const prayerTimeMonthNotifierProvider = PrayerTimeMonthNotifierFamily._();

final class PrayerTimeMonthNotifierProvider
    extends
        $AsyncNotifierProvider<
          PrayerTimeMonthNotifier,
          PrayerTimingMonthResponseModel
        > {
  const PrayerTimeMonthNotifierProvider._({
    required PrayerTimeMonthNotifierFamily super.from,
    required ({int method, int school, int latitudeAdjustmentMethod})
    super.argument,
  }) : super(
         retry: null,
         name: r'prayerTimeMonthNotifierProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prayerTimeMonthNotifierHash();

  @override
  String toString() {
    return r'prayerTimeMonthNotifierProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PrayerTimeMonthNotifier create() => PrayerTimeMonthNotifier();

  @override
  bool operator ==(Object other) {
    return other is PrayerTimeMonthNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$prayerTimeMonthNotifierHash() =>
    r'aeeb9dac635336e3213eded6a7926338135c26b1';

final class PrayerTimeMonthNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PrayerTimeMonthNotifier,
          AsyncValue<PrayerTimingMonthResponseModel>,
          PrayerTimingMonthResponseModel,
          FutureOr<PrayerTimingMonthResponseModel>,
          ({int method, int school, int latitudeAdjustmentMethod})
        > {
  const PrayerTimeMonthNotifierFamily._()
    : super(
        retry: null,
        name: r'prayerTimeMonthNotifierProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PrayerTimeMonthNotifierProvider call({
    int method = 1,
    int school = 0,
    int latitudeAdjustmentMethod = 0,
  }) => PrayerTimeMonthNotifierProvider._(
    argument: (
      method: method,
      school: school,
      latitudeAdjustmentMethod: latitudeAdjustmentMethod,
    ),
    from: this,
  );

  @override
  String toString() => r'prayerTimeMonthNotifierProvider';
}

abstract class _$PrayerTimeMonthNotifierBase
    extends $AsyncNotifier<PrayerTimingMonthResponseModel> {
  late final _$args =
      ref.$arg as ({int method, int school, int latitudeAdjustmentMethod});
  int get method => _$args.method;
  int get school => _$args.school;
  int get latitudeAdjustmentMethod => _$args.latitudeAdjustmentMethod;

  FutureOr<PrayerTimingMonthResponseModel> build({
    int method = 1,
    int school = 0,
    int latitudeAdjustmentMethod = 0,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      method: _$args.method,
      school: _$args.school,
      latitudeAdjustmentMethod: _$args.latitudeAdjustmentMethod,
    );
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PrayerTimingMonthResponseModel>,
              PrayerTimingMonthResponseModel
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PrayerTimingMonthResponseModel>,
                PrayerTimingMonthResponseModel
              >,
              AsyncValue<PrayerTimingMonthResponseModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(prayerTimingForDate)
const prayerTimingForDateProvider = PrayerTimingForDateFamily._();

final class PrayerTimingForDateProvider
    extends
        $FunctionalProvider<
          AsyncValue<MultiDayTiming?>,
          MultiDayTiming?,
          FutureOr<MultiDayTiming?>
        >
    with $FutureModifier<MultiDayTiming?>, $FutureProvider<MultiDayTiming?> {
  const PrayerTimingForDateProvider._({
    required PrayerTimingForDateFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'prayerTimingForDateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prayerTimingForDateHash();

  @override
  String toString() {
    return r'prayerTimingForDateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MultiDayTiming?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MultiDayTiming?> create(Ref ref) {
    final argument = this.argument as DateTime;
    return prayerTimingForDate(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PrayerTimingForDateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$prayerTimingForDateHash() =>
    r'0074b7d0550da5c215f9b8d72a7f3b4127747536';

final class PrayerTimingForDateFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MultiDayTiming?>, DateTime> {
  const PrayerTimingForDateFamily._()
    : super(
        retry: null,
        name: r'prayerTimingForDateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PrayerTimingForDateProvider call(DateTime date) =>
      PrayerTimingForDateProvider._(argument: date, from: this);

  @override
  String toString() => r'prayerTimingForDateProvider';
}

@ProviderFor(hasPrayerDataForDate)
const hasPrayerDataForDateProvider = HasPrayerDataForDateFamily._();

final class HasPrayerDataForDateProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const HasPrayerDataForDateProvider._({
    required HasPrayerDataForDateFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'hasPrayerDataForDateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$hasPrayerDataForDateHash();

  @override
  String toString() {
    return r'hasPrayerDataForDateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as DateTime;
    return hasPrayerDataForDate(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is HasPrayerDataForDateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$hasPrayerDataForDateHash() =>
    r'22d25ec8b67d8276d565031165342781268f7871';

final class HasPrayerDataForDateFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, DateTime> {
  const HasPrayerDataForDateFamily._()
    : super(
        retry: null,
        name: r'hasPrayerDataForDateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HasPrayerDataForDateProvider call(DateTime date) =>
      HasPrayerDataForDateProvider._(argument: date, from: this);

  @override
  String toString() => r'hasPrayerDataForDateProvider';
}

@ProviderFor(hasPrayerDataForCurrentMonth)
const hasPrayerDataForCurrentMonthProvider =
    HasPrayerDataForCurrentMonthProvider._();

final class HasPrayerDataForCurrentMonthProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const HasPrayerDataForCurrentMonthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasPrayerDataForCurrentMonthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasPrayerDataForCurrentMonthHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return hasPrayerDataForCurrentMonth(ref);
  }
}

String _$hasPrayerDataForCurrentMonthHash() =>
    r'5b2d24f27d1f266115494b85fb9342bb8ede72a0';

@ProviderFor(currentRelevantPrayer)
const currentRelevantPrayerProvider = CurrentRelevantPrayerProvider._();

final class CurrentRelevantPrayerProvider
    extends
        $FunctionalProvider<
          AsyncValue<PrayerTimeWithOffset?>,
          PrayerTimeWithOffset?,
          Stream<PrayerTimeWithOffset?>
        >
    with
        $FutureModifier<PrayerTimeWithOffset?>,
        $StreamProvider<PrayerTimeWithOffset?> {
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
  $StreamProviderElement<PrayerTimeWithOffset?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PrayerTimeWithOffset?> create(Ref ref) {
    return currentRelevantPrayer(ref);
  }
}

String _$currentRelevantPrayerHash() =>
    r'20fc89a23573cf926531bee821044086a1fd9a09';

@ProviderFor(prayerTimeline)
const prayerTimelineProvider = PrayerTimelineProvider._();

final class PrayerTimelineProvider
    extends
        $FunctionalProvider<
          AsyncValue<PrayerWindow?>,
          PrayerWindow?,
          Stream<PrayerWindow?>
        >
    with $FutureModifier<PrayerWindow?>, $StreamProvider<PrayerWindow?> {
  const PrayerTimelineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prayerTimelineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prayerTimelineHash();

  @$internal
  @override
  $StreamProviderElement<PrayerWindow?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PrayerWindow?> create(Ref ref) {
    return prayerTimeline(ref);
  }
}

String _$prayerTimelineHash() => r'213048dce8921500833dded758a548a5517bdac6';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// JsonGenerator
// **************************************************************************

abstract class _$PrayerTimeMonthNotifier extends _$PrayerTimeMonthNotifierBase {
  /// The default key used by [persist].
  String get key {
    late final args = (
      method: method,
      school: school,
      latitudeAdjustmentMethod: latitudeAdjustmentMethod,
    );
    late final resolvedKey = 'PrayerTimeMonthNotifier($args)';

    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(PrayerTimingMonthResponseModel state)? encode,
    PrayerTimingMonthResponseModel Function(String encoded)? decode,
    StorageOptions options = const StorageOptions(),
  }) {
    return NotifierPersistX(this).persist<String, String>(
      storage,
      key: key ?? this.key,
      encode: encode ?? $jsonCodex.encode,
      decode:
          decode ??
          (encoded) {
            final e = $jsonCodex.decode(encoded);
            return PrayerTimingMonthResponseModel.fromJson(
              e as Map<String, Object?>,
            );
          },
      options: options,
    );
  }
}
