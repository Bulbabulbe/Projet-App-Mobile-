import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/game_state.dart';

/// Settings page.
class SettingsPage extends StatelessWidget {
    const SettingsPage({super.key});

    @override
    Widget build(BuildContext context) {
        final game = context.watch<GameState>();

        return Scaffold(
            appBar: AppBar(
                title: const Text('Paramètres'),
            ),
            body: Center(
                child: ElevatedButton(
                    onPressed: game.resetGame,
                    child: const Text('Réinitialiser la partie'),
                ),
            ),
        );
    }
}
