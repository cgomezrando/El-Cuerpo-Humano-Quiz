import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'quiz_screen_widget.dart' show QuizScreenWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizScreenModel extends FlutterFlowModel<QuizScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getNextPlayer] action in Icon widget.
  int? nextPlayerValue;
  // Stores action output result for [Custom Action - getWinnerName] action in Icon widget.
  String? winnerName;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 20000;
  int timerMilliseconds = 20000;
  String timerValue = StopWatchTimer.getDisplayTime(
    20000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Custom Action - isCorrectAnswer] action in Container widget.
  bool? isCorrectA;
  // Stores action output result for [Custom Action - isCorrectAnswer] action in Container widget.
  bool? isCorrectB;
  // Stores action output result for [Custom Action - isCorrectAnswer] action in Container widget.
  bool? isCorrectC;
  // Stores action output result for [Custom Action - isCorrectAnswer] action in Container widget.
  bool? isCorrectD;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
