// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getWinnerName(
  int playerCount,
  String player1Name,
  int player1Score,
  String player2Name,
  int player2Score,
  String player3Name,
  int player3Score,
  String player4Name,
  int player4Score,
) async {
  final players = [
    {
      'name': player1Name.trim().isEmpty ? 'Jugador 1' : player1Name.trim(),
      'score': player1Score,
    },
    {
      'name': player2Name.trim().isEmpty ? 'Jugador 2' : player2Name.trim(),
      'score': player2Score,
    },
    {
      'name': player3Name.trim().isEmpty ? 'Jugador 3' : player3Name.trim(),
      'score': player3Score,
    },
    {
      'name': player4Name.trim().isEmpty ? 'Jugador 4' : player4Name.trim(),
      'score': player4Score,
    },
  ].take(playerCount).toList();

  final maxScore =
      players.map((p) => p['score'] as int).reduce((a, b) => a > b ? a : b);

  final winners = players.where((p) => p['score'] == maxScore).toList();

  if (winners.length == 1) {
    return winners.first['name'] as String;
  }

  return 'EMPATE';
}
