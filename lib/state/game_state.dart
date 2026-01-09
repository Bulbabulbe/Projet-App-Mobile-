import 'dart:async';
import 'package:flutter/material.dart';

/// GameState manages all Oreo Clicker logic.
/// Code written in a simple and educational style (W3Schools inspired).
class GameState extends ChangeNotifier {
    int _oreos = 0;

    // Click upgrade
    int _clickPower = 1;
    int _clickUpgradeCost = 30;

    // Auto clicker
    Timer? _autoClicker;
    int _autoClickerLevel = 0;
    int _autoClickerCost = 50;

    // ===== GETTERS =====

    int get oreos => _oreos;

    int get clickPower => _clickPower;
    int get clickUpgradeCost => _clickUpgradeCost;

    int get autoClickerLevel => _autoClickerLevel;
    int get autoClickerCost => _autoClickerCost;

    // ===== GAME LOGIC =====

    /// Click on the Oreo.
    void clickOreo() {
        _oreos += _clickPower;
        notifyListeners();
    }

    /// Upgrade click power (more Oreos per click).
    void upgradeClickPower() {
        if (_oreos < _clickUpgradeCost) {
            return;
        }

        _oreos -= _clickUpgradeCost;
        _clickPower++;
        _clickUpgradeCost *= 2;

        notifyListeners();
    }

    /// Upgrade auto clicker (Cookie Clicker inspired).
    void upgradeAutoClicker() {
        if (_oreos < _autoClickerCost) {
            return;
        }

        _oreos -= _autoClickerCost;
        _autoClickerLevel++;
        _autoClickerCost *= 2;

        _startAutoClicker();
        notifyListeners();
    }

    /// Automatically generates Oreos every second.
    void _startAutoClicker() {
        _autoClicker ??= Timer.periodic(
            const Duration(seconds: 1),
            (_) {
                _oreos += _autoClickerLevel;
                notifyListeners();
            },
        );
    }

    /// Reset the entire game.
    void resetGame() {
        _oreos = 0;
        _clickPower = 1;
        _clickUpgradeCost = 30;
        _autoClickerLevel = 0;
        _autoClickerCost = 50;

        _autoClicker?.cancel();
        _autoClicker = null;

        notifyListeners();
    }
}
