import 'package:adhan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/router_provider.dart';
import 'providers/app_providers.dart';
import 'services/notification_service.dart';

const Color kPrimaryGreen = Color(0xFF2E6B57);
const Color kBackground = Color(0xFFF7FBF7);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Adhan',
      theme: MaterialTheme().light(),
      darkTheme: MaterialTheme().dark(),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
