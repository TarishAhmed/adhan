// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preferences_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AllNotificationPref)
const allNotificationPrefProvider = AllNotificationPrefProvider._();

final class AllNotificationPrefProvider
    extends $AsyncNotifierProvider<AllNotificationPref, Map<String, dynamic>> {
  const AllNotificationPrefProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allNotificationPrefProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allNotificationPrefHash();

  @$internal
  @override
  AllNotificationPref create() => AllNotificationPref();
}

String _$allNotificationPrefHash() =>
    r'7628327dc70b987cc37698643251bae326cfabc2';

abstract class _$AllNotificationPref
    extends $AsyncNotifier<Map<String, dynamic>> {
  FutureOr<Map<String, dynamic>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<Map<String, dynamic>>, Map<String, dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, dynamic>>,
                Map<String, dynamic>
              >,
              AsyncValue<Map<String, dynamic>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SpecificNotificationPref)
const specificNotificationPrefProvider = SpecificNotificationPrefFamily._();

final class SpecificNotificationPrefProvider
    extends $AsyncNotifierProvider<SpecificNotificationPref, bool> {
  const SpecificNotificationPrefProvider._({
    required SpecificNotificationPrefFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'specificNotificationPrefProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$specificNotificationPrefHash();

  @override
  String toString() {
    return r'specificNotificationPrefProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SpecificNotificationPref create() => SpecificNotificationPref();

  @override
  bool operator ==(Object other) {
    return other is SpecificNotificationPrefProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$specificNotificationPrefHash() =>
    r'1640a0ef3c5bd935fc48c9fc1c61728f1610bbfe';

final class SpecificNotificationPrefFamily extends $Family
    with
        $ClassFamilyOverride<
          SpecificNotificationPref,
          AsyncValue<bool>,
          bool,
          FutureOr<bool>,
          String
        > {
  const SpecificNotificationPrefFamily._()
    : super(
        retry: null,
        name: r'specificNotificationPrefProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SpecificNotificationPrefProvider call(String prayerKey) =>
      SpecificNotificationPrefProvider._(argument: prayerKey, from: this);

  @override
  String toString() => r'specificNotificationPrefProvider';
}

abstract class _$SpecificNotificationPref extends $AsyncNotifier<bool> {
  late final _$args = ref.$arg as String;
  String get prayerKey => _$args;

  FutureOr<bool> build(String prayerKey);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AllSoundPref)
const allSoundPrefProvider = AllSoundPrefProvider._();

final class AllSoundPrefProvider
    extends $AsyncNotifierProvider<AllSoundPref, Map<String, dynamic>> {
  const AllSoundPrefProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allSoundPrefProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allSoundPrefHash();

  @$internal
  @override
  AllSoundPref create() => AllSoundPref();
}

String _$allSoundPrefHash() => r'935c0baf35a5da0d94c9804a98498a3e03ed0891';

abstract class _$AllSoundPref extends $AsyncNotifier<Map<String, dynamic>> {
  FutureOr<Map<String, dynamic>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<Map<String, dynamic>>, Map<String, dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, dynamic>>,
                Map<String, dynamic>
              >,
              AsyncValue<Map<String, dynamic>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SpecificSoundPref)
const specificSoundPrefProvider = SpecificSoundPrefFamily._();

final class SpecificSoundPrefProvider
    extends $AsyncNotifierProvider<SpecificSoundPref, String> {
  const SpecificSoundPrefProvider._({
    required SpecificSoundPrefFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'specificSoundPrefProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$specificSoundPrefHash();

  @override
  String toString() {
    return r'specificSoundPrefProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SpecificSoundPref create() => SpecificSoundPref();

  @override
  bool operator ==(Object other) {
    return other is SpecificSoundPrefProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$specificSoundPrefHash() => r'c21c68c4e91cd747cf51ccbbf11ce6c374de670f';

final class SpecificSoundPrefFamily extends $Family
    with
        $ClassFamilyOverride<
          SpecificSoundPref,
          AsyncValue<String>,
          String,
          FutureOr<String>,
          String
        > {
  const SpecificSoundPrefFamily._()
    : super(
        retry: null,
        name: r'specificSoundPrefProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SpecificSoundPrefProvider call(String prayerKey) =>
      SpecificSoundPrefProvider._(argument: prayerKey, from: this);

  @override
  String toString() => r'specificSoundPrefProvider';
}

abstract class _$SpecificSoundPref extends $AsyncNotifier<String> {
  late final _$args = ref.$arg as String;
  String get prayerKey => _$args;

  FutureOr<String> build(String prayerKey);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AllAdvanceTimePref)
const allAdvanceTimePrefProvider = AllAdvanceTimePrefProvider._();

final class AllAdvanceTimePrefProvider
    extends $AsyncNotifierProvider<AllAdvanceTimePref, Map<String, dynamic>> {
  const AllAdvanceTimePrefProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allAdvanceTimePrefProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allAdvanceTimePrefHash();

  @$internal
  @override
  AllAdvanceTimePref create() => AllAdvanceTimePref();
}

String _$allAdvanceTimePrefHash() =>
    r'3492aeff0918c6a3b9945e0aab034e3224384418';

abstract class _$AllAdvanceTimePref
    extends $AsyncNotifier<Map<String, dynamic>> {
  FutureOr<Map<String, dynamic>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<Map<String, dynamic>>, Map<String, dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, dynamic>>,
                Map<String, dynamic>
              >,
              AsyncValue<Map<String, dynamic>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SpecificAdvanceTimePref)
const specificAdvanceTimePrefProvider = SpecificAdvanceTimePrefFamily._();

final class SpecificAdvanceTimePrefProvider
    extends $AsyncNotifierProvider<SpecificAdvanceTimePref, int> {
  const SpecificAdvanceTimePrefProvider._({
    required SpecificAdvanceTimePrefFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'specificAdvanceTimePrefProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$specificAdvanceTimePrefHash();

  @override
  String toString() {
    return r'specificAdvanceTimePrefProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SpecificAdvanceTimePref create() => SpecificAdvanceTimePref();

  @override
  bool operator ==(Object other) {
    return other is SpecificAdvanceTimePrefProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$specificAdvanceTimePrefHash() =>
    r'530a44c1674833daf236751bb52a63de837bd8b0';

final class SpecificAdvanceTimePrefFamily extends $Family
    with
        $ClassFamilyOverride<
          SpecificAdvanceTimePref,
          AsyncValue<int>,
          int,
          FutureOr<int>,
          String
        > {
  const SpecificAdvanceTimePrefFamily._()
    : super(
        retry: null,
        name: r'specificAdvanceTimePrefProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SpecificAdvanceTimePrefProvider call(String prayerKey) =>
      SpecificAdvanceTimePrefProvider._(argument: prayerKey, from: this);

  @override
  String toString() => r'specificAdvanceTimePrefProvider';
}

abstract class _$SpecificAdvanceTimePref extends $AsyncNotifier<int> {
  late final _$args = ref.$arg as String;
  String get prayerKey => _$args;

  FutureOr<int> build(String prayerKey);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AllDayPref)
const allDayPrefProvider = AllDayPrefProvider._();

final class AllDayPrefProvider
    extends $AsyncNotifierProvider<AllDayPref, Map<String, dynamic>> {
  const AllDayPrefProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allDayPrefProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allDayPrefHash();

  @$internal
  @override
  AllDayPref create() => AllDayPref();
}

String _$allDayPrefHash() => r'd10fbad4026382ee681b9069f1fa181ccbac7022';

abstract class _$AllDayPref extends $AsyncNotifier<Map<String, dynamic>> {
  FutureOr<Map<String, dynamic>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<Map<String, dynamic>>, Map<String, dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, dynamic>>,
                Map<String, dynamic>
              >,
              AsyncValue<Map<String, dynamic>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SpecificDayPref)
const specificDayPrefProvider = SpecificDayPrefFamily._();

final class SpecificDayPrefProvider
    extends $AsyncNotifierProvider<SpecificDayPref, Set<String>> {
  const SpecificDayPrefProvider._({
    required SpecificDayPrefFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'specificDayPrefProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$specificDayPrefHash();

  @override
  String toString() {
    return r'specificDayPrefProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SpecificDayPref create() => SpecificDayPref();

  @override
  bool operator ==(Object other) {
    return other is SpecificDayPrefProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$specificDayPrefHash() => r'cc2f4c169a4cfca4547bdb4206905d169d089184';

final class SpecificDayPrefFamily extends $Family
    with
        $ClassFamilyOverride<
          SpecificDayPref,
          AsyncValue<Set<String>>,
          Set<String>,
          FutureOr<Set<String>>,
          String
        > {
  const SpecificDayPrefFamily._()
    : super(
        retry: null,
        name: r'specificDayPrefProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SpecificDayPrefProvider call(String prayerKey) =>
      SpecificDayPrefProvider._(argument: prayerKey, from: this);

  @override
  String toString() => r'specificDayPrefProvider';
}

abstract class _$SpecificDayPref extends $AsyncNotifier<Set<String>> {
  late final _$args = ref.$arg as String;
  String get prayerKey => _$args;

  FutureOr<Set<String>> build(String prayerKey);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Set<String>>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Set<String>>, Set<String>>,
              AsyncValue<Set<String>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
