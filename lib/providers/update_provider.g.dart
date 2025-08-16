// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UpdateNotifier)
const updateNotifierProvider = UpdateNotifierProvider._();

final class UpdateNotifierProvider
    extends $AsyncNotifierProvider<UpdateNotifier, UpdateInfo?> {
  const UpdateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateNotifierProvider',
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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
