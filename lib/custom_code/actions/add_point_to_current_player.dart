// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addPointToCurrentPlayer(
  int currentPlayer,
) async {
  switch (currentPlayer) {
    case 1:
      FFAppState().player1Score++;
      break;

    case 2:
      FFAppState().player2Score++;
      break;

    case 3:
      FFAppState().player3Score++;
      break;

    case 4:
      FFAppState().player4Score++;
      break;
  }
}
