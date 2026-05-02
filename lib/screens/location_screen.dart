import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

import '../l10n/gen/app_localizations.dart';
import '../providers/app_providers.dart';
import '../providers/prayer_timing_provider.dart';
import '../services/home_widget_service.dart';
import '../services/location_storage_service.dart';
import '../theme/tokens.dart';
import '../utils/app_logger.dart';
import '../widgets/states/empty_state.dart';

/// Location management:
/// - View current location (city + lat/lng + last-updated)
/// - "Use current location" button to refresh GPS
/// - Auto-detect toggle (properly bound to settings — fixes hardcoded `true`)
/// - Manual city search (typeahead via geocoding) that overrides auto-location
class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  final _searchCtrl = TextEditingController();
  Timer? _debounce;
  bool _searching = false;
  List<Location> _results = const [];
  String? _searchError;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    super.dispose();
  }

  void _onQueryChanged(String q) {
    _debounce?.cancel();
    if (q.trim().length < 2) {
      setState(() {
        _results = const [];
        _searchError = null;
      });
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 400), () => _search(q));
  }

  Future<void> _search(String q) async {
    setState(() {
      _searching = true;
      _searchError = null;
    });
    try {
      final list = await locationFromAddress(q);
      if (!mounted) return;
      setState(() => _results = list);
    } catch (e) {
      AppLogger.w('City search failed', error: e);
      if (!mounted) return;
      setState(() => _searchError = e.toString());
    } finally {
      if (mounted) setState(() => _searching = false);
    }
  }

  Future<void> _selectResult(Location loc) async {
    HapticFeedback.selectionClick();
    String? city;
    try {
      final places = await placemarkFromCoordinates(
        loc.latitude,
        loc.longitude,
      );
      city = places.isNotEmpty
          ? (places.first.locality ?? places.first.name)
          : _searchCtrl.text;
    } catch (_) {
      city = _searchCtrl.text;
    }
    final timezone = await FlutterTimezone.getLocalTimezone();

    // Persist as the active location.
    await ref
        .read(locationStorageProvider.notifier)
        .storeLocation(
          lat: loc.latitude,
          lng: loc.longitude,
          timezone: timezone,
          city: city,
        );

    // Switch off auto-location so GPS doesn't override the chosen city.
    ref.read(settingsProvider.notifier).setAutoLocation(false);

    // Refresh the active location AsyncNotifier from cache.
    ref.invalidate(locationProvider);
    ref.invalidate(prayerTimeMonthProvider());
    await HomeWidgetService.manualUpdate(ref.container);

    if (!mounted) return;
    Navigator.of(context).maybePop();
  }

  Future<void> _useCurrent() async {
    HapticFeedback.lightImpact();
    ref.read(settingsProvider.notifier).setAutoLocation(true);
    ref.invalidate(locationProvider);
    ref.invalidate(prayerTimeMonthProvider());
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final settings = ref.watch(settingsProvider);
    final loc = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l.locationTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        children: [
          // Current location card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: AppRadius.allLg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        l.locationCurrentLabel.toUpperCase(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer
                              .withValues(alpha: 0.8),
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  loc.when(
                    loading: () => const SizedBox(
                      height: 60,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (e, _) => AppStateView(
                      icon: Icons.location_off_outlined,
                      title: l.errorLocationGeneric,
                      description: e.toString(),
                      actionLabel: l.errorRetry,
                      onAction: () => ref.invalidate(locationProvider),
                    ),
                    data: (record) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          record.city ?? '${record.lat.toStringAsFixed(3)}, '
                              '${record.lng.toStringAsFixed(3)}',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontFamily: 'NotoSerif',
                          ),
                        ),
                        Text(
                          '${record.lat.toStringAsFixed(4)}°, '
                          '${record.lng.toStringAsFixed(4)}°',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer
                                .withValues(alpha: 0.75),
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          l.locationLastUpdated(
                            DateFormat.MMMd().add_jm().format(DateTime.now()),
                          ),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer
                                .withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Use current location action
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.tonalIcon(
                onPressed: _useCurrent,
                icon: const Icon(Icons.my_location),
                label: Text(l.locationUseCurrent),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Auto-detect toggle (now properly bound)
          SwitchListTile(
            value: settings.autoLocation,
            title: Text(l.locationAutoToggle),
            subtitle: Text(
              settings.autoLocation
                  ? 'Using GPS to find your location'
                  : 'Using a manually set city',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            onChanged: (v) {
              HapticFeedback.lightImpact();
              ref.read(settingsProvider.notifier).setAutoLocation(v);
              if (v) ref.invalidate(locationProvider);
            },
          ),

          const Divider(height: AppSpacing.xxxl),

          // Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Text(
              l.locationSearchLabel.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.primary,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: TextField(
              controller: _searchCtrl,
              onChanged: _onQueryChanged,
              decoration: InputDecoration(
                hintText: l.locationSearchHint,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searching
                    ? const Padding(
                        padding: EdgeInsets.all(AppSpacing.md),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : (_searchCtrl.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchCtrl.clear();
                                _onQueryChanged('');
                              },
                            )
                          : null),
                border: const OutlineInputBorder(
                  borderRadius: AppRadius.allLg,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (_searchError != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Text(
                _searchError!,
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ),
          if (_results.isEmpty &&
              _searchCtrl.text.length >= 2 &&
              !_searching &&
              _searchError == null)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                l.locationSearchEmpty,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ..._results.take(8).map(
            (r) => ListTile(
              leading: const Icon(Icons.place_outlined),
              title: Text(_formatLatLng(r)),
              subtitle: Text(
                'Tap to use this location',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              onTap: () => _selectResult(r),
            ),
          ),
          const SizedBox(height: AppSpacing.xxxl),
        ],
      ),
    );
  }

  String _formatLatLng(Location r) {
    return '${r.latitude.toStringAsFixed(4)}, ${r.longitude.toStringAsFixed(4)}';
  }
}
