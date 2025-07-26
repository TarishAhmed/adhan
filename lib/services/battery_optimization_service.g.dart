// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_optimization_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(batteryOptimizationStatus)
const batteryOptimizationStatusProvider = BatteryOptimizationStatusProvider._();

final class BatteryOptimizationStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>
        >
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  const BatteryOptimizationStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'batteryOptimizationStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$batteryOptimizationStatusHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>> create(Ref ref) {
    return batteryOptimizationStatus(ref);
  }
}

String _$batteryOptimizationStatusHash() =>
    r'220480853dc4af3186fb6c899133d20944b73c35';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
