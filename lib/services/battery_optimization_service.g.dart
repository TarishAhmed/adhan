// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_optimization_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
