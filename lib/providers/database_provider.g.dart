// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DatabaseNotifier)
const databaseProvider = DatabaseNotifierProvider._();

final class DatabaseNotifierProvider
    extends $AsyncNotifierProvider<DatabaseNotifier, void> {
  const DatabaseNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseNotifierHash();

  @$internal
  @override
  DatabaseNotifier create() => DatabaseNotifier();
}

String _$databaseNotifierHash() => r'953f01171191bb8fe2ff214ac97aaac9ee3ed571';

abstract class _$DatabaseNotifier extends $AsyncNotifier<void> {
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
