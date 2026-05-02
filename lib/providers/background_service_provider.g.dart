// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BackgroundServiceNotifier)
const backgroundServiceProvider = BackgroundServiceNotifierProvider._();

final class BackgroundServiceNotifierProvider
    extends $AsyncNotifierProvider<BackgroundServiceNotifier, void> {
  const BackgroundServiceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backgroundServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backgroundServiceNotifierHash();

  @$internal
  @override
  BackgroundServiceNotifier create() => BackgroundServiceNotifier();
}

String _$backgroundServiceNotifierHash() =>
    r'99d995637ac12f1342c93345adca02eab9119500';

abstract class _$BackgroundServiceNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
