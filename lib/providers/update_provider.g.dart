// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UpdateNotifier)
const updateProvider = UpdateNotifierProvider._();

final class UpdateNotifierProvider
    extends $AsyncNotifierProvider<UpdateNotifier, UpdateInfo?> {
  const UpdateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateNotifierHash();

  @$internal
  @override
  UpdateNotifier create() => UpdateNotifier();
}

String _$updateNotifierHash() => r'd24f456b48baa28be39b3accf8c844f60a46e2a3';

abstract class _$UpdateNotifier extends $AsyncNotifier<UpdateInfo?> {
  FutureOr<UpdateInfo?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UpdateInfo?>, UpdateInfo?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UpdateInfo?>, UpdateInfo?>,
              AsyncValue<UpdateInfo?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
