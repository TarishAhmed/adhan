import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import '../services/qibla_service.dart';

class QiblaMapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double qiblaBearingDegrees;

  const QiblaMapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.qiblaBearingDegrees,
  });

  @override
  Widget build(BuildContext context) {

    final mapController = useMemoized(() => MapController(), []);

    // useEffect(() {
    //   // Center map on user's location
    //   mapController.move(
    //     latlng.LatLng(latitude, longitude),
    //     4,
    //   );
    //   return null;
    // }, [mapController, latitude, longitude]);

    final user = latlng.LatLng(latitude, longitude);
    final kaaba = latlng.LatLng(
      QiblaService.kaabaLatitude,
      QiblaService.kaabaLongitude,
    );

    // Construct a simple polyline from user → Kaaba
    final polyline = Polyline(
      points: [user, kaaba],
      color: Theme.of(context).colorScheme.primary,
      strokeWidth: 4,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 220,
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(initialZoom: 4, initialCenter: user),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'org.tarish.adhan',
            ),
            PolylineLayer(polylines: [polyline]),
            MarkerLayer(
              markers: [
                Marker(
                  point: user,
                  width: 40,
                  height: 40,
                  child: const Icon(Icons.my_location, color: Colors.blue),
                ),
                Marker(
                  point: kaaba,
                  width: 40,
                  height: 40,
                  child: const Text('🕋', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
