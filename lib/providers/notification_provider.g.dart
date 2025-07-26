// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PrayerChannel)
const prayerChannelProvider = PrayerChannelFamily._();

final class PrayerChannelProvider
    extends $AsyncNotifierProvider<PrayerChannel, String?> {
  const PrayerChannelProvider._({
    required PrayerChannelFamily super.from,
    required PrayerTime super.argument,
  }) : super(
         retry: null,
         name: r'prayerChannelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prayerChannelHash();

  @override
  String toString() {
    return r'prayerChannelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PrayerChannel create() => PrayerChannel();

  @override
  bool operator ==(Object other) {
    return other is PrayerChannelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$prayerChannelHash() => r'303d853e2cae9239148ac28cbd016f682cb469e8';

final class PrayerChannelFamily extends $Family
    with
        $ClassFamilyOverride<
          PrayerChannel,
          AsyncValue<String?>,
          String?,
          FutureOr<String?>,
          PrayerTime
        > {
  const PrayerChannelFamily._()
    : super(
        retry: null,
        name: r'prayerChannelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PrayerChannelProvider call(PrayerTime prayer) =>
      PrayerChannelProvider._(argument: prayer, from: this);

  @override
  String toString() => r'prayerChannelProvider';
}

abstract class _$PrayerChannel extends $AsyncNotifier<String?> {
  late final _$args = ref.$arg as PrayerTime;
  PrayerTime get prayer => _$args;

  FutureOr<String?> build(PrayerTime prayer);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
