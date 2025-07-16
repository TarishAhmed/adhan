// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(BackgroundServiceNotifier)
const backgroundServiceNotifierProvider = BackgroundServiceNotifierProvider._();

final class BackgroundServiceNotifierProvider
    extends $AsyncNotifierProvider<BackgroundServiceNotifier, void> {
  const BackgroundServiceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backgroundServiceNotifierProvider',
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
    r'238c696dfeb1f7bb5a20b64fb5e7c4e6b4fa3fa4';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
