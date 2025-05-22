import 'dart:io';

import 'package:ally/pages/home/home.dart';
import 'package:ally/pages/primary/primary.dart';
import 'package:ally/themes/dark.dart';
import 'package:ally/themes/light.dart';
import 'package:ally/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set high refresh rate for android, add an option to drop this to the lowest
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  /// load the preferred theme on startup
  loadPreferredThemeOnStartup() {
    SharedPreferences.getInstance().then((prefs) {
      bool? isNight = prefs.getBool('night');

      if (isNight == null) {
        ref.watch(themeModeProvider.notifier).setTheme(ThemeMode.system);
      }

      if (isNight == true) {
        ref.watch(themeModeProvider.notifier).toDark();
      }

      if (isNight == false) {
        ref.watch(themeModeProvider.notifier).toLight();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // load theme on startup
    loadPreferredThemeOnStartup();

    ///
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeModeProvider),
      home: PrimaryPage(),
    );
  }
}
