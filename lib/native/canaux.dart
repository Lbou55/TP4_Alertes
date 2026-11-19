import 'package:flutter/services.dart';

/// Single access point to the native Kotlin code.
class CanauxNatifs {
  // Steps 1 and 2
  static const _alerte = MethodChannel('alerte/notifier');

  static Future<bool> demanderPermissionNotif() async =>
      await _alerte.invokeMethod<bool>('demanderPermission') ?? false;

  static Future<int?> notifier(String titre, String texte) =>
      _alerte.invokeMethod<int>('notifier', {'titre': titre, 'texte': texte});

  static Future<Map<String, dynamic>?> actionInitiale() =>
      _alerte.invokeMapMethod<String, dynamic>('actionInitiale');

  static void ecouterActions(void Function(Map<String, dynamic>) traiter) {
    _alerte.setMethodCallHandler((call) async {
      if (call.method == 'surAction') {
        traiter(Map<String, dynamic>.from(call.arguments as Map));
      }
    });
  }

  // Step 3
  static const _sync = MethodChannel('sync/planifier');

  static Future<void> planifier(int seuil) =>
      _sync.invokeMethod('planifier', {'seuil': seuil});

  static Future<void> verifierMaintenant(int seuil) =>
      _sync.invokeMethod('maintenant', {'seuil': seuil});

  static Future<void> annulerPlanification() => _sync.invokeMethod('annuler');

  // Step 4
  static const _service = MethodChannel('service/surveillance');

  static Future<void> demarrerSurveillance(double seuil) =>
      _service.invokeMethod('demarrer', {'seuil': seuil});

  static Future<void> arreterSurveillance() => _service.invokeMethod('arreter');

  // Exercise 2
  static Future<bool> surveillanceActive() async =>
      await _service.invokeMethod<bool>('estActif') ?? false;
}
