import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/game_state.dart';
import 'pages/game_page.dart';
import 'pages/settings_page.dart';

void main() {
    runApp(
        ChangeNotifierProvider(
            create: (_) => GameState(),
            child: const OreoClickerApp(),
        ),
    );
}

class OreoClickerApp extends StatelessWidget {
    const OreoClickerApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Oreo Clicker',
            theme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: const Color(0xFF0D0D0D),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black,
                    centerTitle: true,
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E1E1E),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                    ),
                ),
            ),
            routes: {
                '/': (_) => const GamePage(),
                '/settings': (_) => const SettingsPage(),
            },
        );
    }
}
