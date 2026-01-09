import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/game_state.dart';

/// Main game screen.
class GamePage extends StatelessWidget {
    const GamePage({super.key});

    @override
    Widget build(BuildContext context) {
        final game = context.watch<GameState>();

        return Scaffold(
            appBar: AppBar(
                title: const Text('Oreo Clicker'),
                actions: [
                    IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {
                            Navigator.pushNamed(context, '/settings');
                        },
                    ),
                ],
            ),
            body: Column(
                children: [
                    /// ZONE CENTRALE (score + Oreo)
                    Expanded(
                        flex: 3,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                const Text(
                                    'Oreos',
                                    style: TextStyle(fontSize: 24),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                    game.oreos.toString(),
                                    style: const TextStyle(
                                        fontSize: 46,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                const SizedBox(height: 30),
                                GestureDetector(
                                    onTap: game.clickOreo,
                                    child: Image.asset(
                                        'assets/images/oreo.png',
                                        width: 180,
                                    ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                    '+${game.clickPower} par clic',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                    ),
                                ),
                            ],
                        ),
                    ),

                    /// MENU DES AMÉLIORATIONS
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: Color(0xFF141414),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                ),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    const Text(
                                        'Usine à Oreos',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                    const SizedBox(height: 16),

                                    _UpgradeTile(
                                        title: 'Recette Double Crème',
                                        description: 'Augmente le nombre d’oreos par clic',
                                        level: game.clickPower,
                                        cost: game.clickUpgradeCost,
                                        onPressed: game.upgradeClickPower,
                                    ),

                                    _UpgradeTile(
                                        title: 'Machine à Tremper dans le Lait',
                                        description: 'Production automatique d’oreos',
                                        level: game.autoClickerLevel,
                                        cost: game.autoClickerCost,
                                        onPressed: game.upgradeAutoClicker,
                                    ),
                                ],
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}

class _UpgradeTile extends StatelessWidget {
    final String title;
    final String description;
    final int level;
    final int cost;
    final VoidCallback onPressed;

    const _UpgradeTile({
        required this.title,
        required this.description,
        required this.level,
        required this.cost,
        required this.onPressed,
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                Text(
                                    description,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                    ),
                                ),
                                Text(
                                    'Niveau : $level',
                                    style: const TextStyle(fontSize: 12),
                                ),
                            ],
                        ),
                    ),
                    ElevatedButton(
                        onPressed: onPressed,
                        child: Text('$cost'),
                    ),
                ],
            ),
        );
    }
}
