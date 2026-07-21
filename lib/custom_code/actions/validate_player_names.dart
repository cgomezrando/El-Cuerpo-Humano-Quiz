// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> validatePlayerNames(
  int playerCount,
  String? player1Name,
  String? player2Name,
  String? player3Name,
  String? player4Name,
) async {
  final names = [
    player1Name?.trim() ?? '',
    player2Name?.trim() ?? '',
    player3Name?.trim() ?? '',
    player4Name?.trim() ?? '',
  ];

  for (int i = 0; i < playerCount; i++) {
    if (names[i].isEmpty) {
      return false;
    }
  }

  return true;
}
