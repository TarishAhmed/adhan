// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_timing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PrayerTimeMonthNotifier)
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
    r'd6332a1da04cd418853fd4a44dbcb53e6a448395';

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

abstract class _$PrayerTimeMonthNotifier
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
    r'efa0f2e1dbfcf1fed0881bf49a566ece07a633e2';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
