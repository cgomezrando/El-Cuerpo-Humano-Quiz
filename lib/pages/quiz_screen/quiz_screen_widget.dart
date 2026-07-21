import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_screen_model.dart';
export 'quiz_screen_model.dart';

class QuizScreenWidget extends StatefulWidget {
  const QuizScreenWidget({super.key});

  static String routeName = 'QuizScreen';
  static String routePath = '/quizScreen';

  @override
  State<QuizScreenWidget> createState() => _QuizScreenWidgetState();
}

class _QuizScreenWidgetState extends State<QuizScreenWidget> {
  late QuizScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().InstructionsDuringGame == false) {
        FFAppState().StartGame = false;
        safeSetState(() {});
      } else {
        FFAppState().StartGame = true;
        safeSetState(() {});
        await Future.delayed(
          Duration(
            milliseconds: 200,
          ),
        );
        _model.timerController.timer.setPresetTime(
          mSec: FFAppState().SavedTime,
          add: false,
        );
        _model.timerController.onResetTimer();

        _model.timerController.onStartTimer();
        FFAppState().InstructionsDuringGame = false;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Designer_(25).png',
              ).image,
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 25.0, 0.0, 0.0),
                        child: Container(
                          height: 110.0,
                          constraints: BoxConstraints(
                            minWidth: 300.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                            ),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Pregunta ${valueOrDefault<String>(
                                          FFAppState()
                                              .currentPlayerQuestion
                                              .toString(),
                                          'currentPlayerQuestion',
                                        )} de ${FFAppState().totalQuestionsGame.toString()}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .onPrimary,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      () {
                                        if (FFAppState().currentPlayer == 1) {
                                          return 'Turno de ${FFAppState().player1Name}';
                                        } else if (FFAppState().currentPlayer ==
                                            2) {
                                          return 'Turno de ${FFAppState().player2Name}';
                                        } else if (FFAppState().currentPlayer ==
                                            3) {
                                          return 'Turno de ${FFAppState().player3Name}';
                                        } else if (FFAppState().currentPlayer ==
                                            4) {
                                          return 'Turno de ${FFAppState().player4Name}';
                                        } else {
                                          return FFAppState().player1Name;
                                        }
                                      }(),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .onPrimary,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                            lineHeight: 1.3,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 25.0, 0.0, 0.0),
                        child: Container(
                          height: 110.0,
                          constraints: BoxConstraints(
                            minWidth: 265.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                            ),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.timerController.onStopTimer();
                                      FFAppState().SavedTime =
                                          _model.timerMilliseconds;
                                      safeSetState(() {});
                                      FFAppState().InstructionsDuringGame =
                                          true;
                                      safeSetState(() {});

                                      context
                                          .pushNamed(GameRulesWidget.routeName);
                                    },
                                    child: Icon(
                                      Icons.help_outline,
                                      color: Colors.white,
                                      size: 80.0,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().playerCount = 1;
                                        FFAppState().player1Name = '';
                                        FFAppState().player2Name = '';
                                        FFAppState().player3Name = '';
                                        FFAppState().player4Name = '';
                                        FFAppState().player1Score = 0;
                                        FFAppState().player2Score = 0;
                                        FFAppState().player3Score = 0;
                                        FFAppState().player4Score = 0;
                                        FFAppState().totalQuestionsGame = 20;
                                        FFAppState().selectedAnswer = '';
                                        FFAppState().answerResult = '';
                                        FFAppState().winnerName = '';
                                        FFAppState().StartGame = false;
                                        FFAppState().InstructionsDuringGame =
                                            false;
                                        FFAppState().currentQuestionIndex = 0;
                                        FFAppState().currentPlayer = 1;
                                        FFAppState().currentPlayerQuestion = 1;
                                        FFAppState().questionTimer = 20;
                                        FFAppState().waitingNextTurn = false;
                                        FFAppState().timerExpired = false;
                                        FFAppState().SavedTime = 0;
                                        safeSetState(() {});

                                        context.pushNamed(
                                            HomeScreenWidget.routeName);
                                      },
                                      child: Icon(
                                        Icons.home,
                                        color: Colors.white,
                                        size: 80.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if ((FFAppState().waitingNextTurn == true) &&
                                  (FFAppState().currentPlayerQuestion <
                                      FFAppState().totalQuestionsGame) &&
                                  FFAppState().StartGame)
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.nextPlayerValue =
                                            await actions.getNextPlayer(
                                          FFAppState().currentPlayer,
                                          FFAppState().playerCount,
                                        );
                                        FFAppState().currentPlayer =
                                            _model.nextPlayerValue!;
                                        safeSetState(() {});
                                        FFAppState().currentQuestionIndex =
                                            FFAppState().currentQuestionIndex +
                                                1;
                                        safeSetState(() {});
                                        FFAppState().currentPlayerQuestion =
                                            FFAppState().currentPlayerQuestion +
                                                1;
                                        safeSetState(() {});
                                        FFAppState().answerResult = '';
                                        safeSetState(() {});
                                        FFAppState().selectedAnswer = '';
                                        safeSetState(() {});
                                        FFAppState().timerExpired = false;
                                        safeSetState(() {});
                                        FFAppState().waitingNextTurn = false;
                                        safeSetState(() {});
                                        _model.timerController.timer
                                            .setPresetTime(
                                                mSec: 20000, add: false);
                                        _model.timerController.onResetTimer();

                                        _model.timerController.onStartTimer();

                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 80.0,
                                      ),
                                    ),
                                  ),
                                ),
                              if ((FFAppState().waitingNextTurn == true) &&
                                  FFAppState().StartGame &&
                                  (FFAppState().currentPlayerQuestion >=
                                      FFAppState().totalQuestionsGame))
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.winnerName =
                                            await actions.getWinnerName(
                                          FFAppState().playerCount,
                                          FFAppState().player1Name,
                                          FFAppState().player1Score,
                                          FFAppState().player2Name,
                                          FFAppState().player2Score,
                                          FFAppState().player3Name,
                                          FFAppState().player3Score,
                                          FFAppState().player4Name,
                                          FFAppState().player4Score,
                                        );
                                        FFAppState().winnerName =
                                            _model.winnerName!;
                                        safeSetState(() {});

                                        context.pushNamed(
                                            ResultsScreenWidget.routeName);

                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.emoji_events,
                                        color: Colors.white,
                                        size: 80.0,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (!FFAppState().StartGame)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 25.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Future.delayed(
                                Duration(
                                  milliseconds: 500,
                                ),
                              );
                              FFAppState().StartGame = true;
                              safeSetState(() {});
                              _model.timerController.onStartTimer();
                            },
                            child: Container(
                              height: 110.0,
                              constraints: BoxConstraints(
                                maxWidth: 340.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0),
                                  bottomLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0),
                                ),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.play_circle,
                                        color: Colors.white,
                                        size: 80.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .transparent,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .transparent,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'EMPIEZA LA PARTIDA',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w800,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .onPrimary,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                  lineHeight: 1.3,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                children: [
                                  if (FFAppState().StartGame == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 0.0, 25.0, 0.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minWidth: 500.0,
                                            minHeight: 100.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24.0),
                                              topRight: Radius.circular(24.0),
                                              bottomLeft: Radius.circular(24.0),
                                              bottomRight:
                                                  Radius.circular(24.0),
                                            ),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 5.0,
                                            ),
                                          ),
                                          child: Visibility(
                                            visible: FFAppState().StartGame,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  FFAppState()
                                                      .gameQuestions
                                                      .elementAtOrNull(FFAppState()
                                                          .currentQuestionIndex)
                                                      ?.question,
                                                  'Cargando...',
                                                ),
                                                maxLines: 2,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                      lineHeight: 1.4,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          if (FFAppState().StartGame == true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  50.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Copilot_20260618_064747.png',
                                  width: 504.8,
                                  height: 200.0,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          if (FFAppState().StartGame == true)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50.0, 5.0, 0.0, 55.0),
                                child: FlutterFlowTimer(
                                  initialTime: _model.timerInitialTimeMs,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timerController,
                                  updateStateInterval:
                                      Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timerMilliseconds = value;
                                    _model.timerValue = displayTime;
                                    if (shouldUpdate) safeSetState(() {});
                                  },
                                  onEnded: () async {
                                    FFAppState().answerResult =
                                        'TIEMPO AGOTADO';
                                    safeSetState(() {});
                                    FFAppState().timerExpired = true;
                                    safeSetState(() {});
                                    FFAppState().waitingNextTurn = true;
                                    safeSetState(() {});
                                    _model.timerController.onStopTimer();
                                  },
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.orbitron(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        color: Color(0xC9F0E80A),
                                        fontSize: 100.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          if ((FFAppState().timerExpired == true) &&
                              (FFAppState().StartGame == true))
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50.0, 0.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/ChatGPT_Image_Jun_19,_2026,_07_38_33_AM.png',
                                    width: 236.8,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (FFAppState().StartGame == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 0.0, 50.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().StartGame == true) {
                              if (FFAppState().waitingNextTurn == false) {
                                FFAppState().selectedAnswer = 'A';
                                safeSetState(() {});
                                _model.isCorrectA =
                                    await actions.isCorrectAnswer(
                                  FFAppState()
                                      .gameQuestions
                                      .elementAtOrNull(
                                          FFAppState().currentQuestionIndex)!
                                      .optionA,
                                  FFAppState()
                                      .gameQuestions
                                      .elementAtOrNull(
                                          FFAppState().currentQuestionIndex)!
                                      .correctAnswer,
                                );
                                if (_model.isCorrectA == true) {
                                  if (FFAppState().currentPlayer == 1) {
                                    FFAppState().player1Score =
                                        FFAppState().player1Score + 1;
                                    safeSetState(() {});
                                  } else {
                                    if (FFAppState().currentPlayer == 2) {
                                      FFAppState().player2Score =
                                          FFAppState().player2Score + 1;
                                      safeSetState(() {});
                                    } else {
                                      if (FFAppState().currentPlayer == 3) {
                                        FFAppState().player3Score =
                                            FFAppState().player3Score + 1;
                                        safeSetState(() {});
                                      } else {
                                        if (FFAppState().currentPlayer == 4) {
                                          FFAppState().player4Score =
                                              FFAppState().player4Score + 1;
                                          safeSetState(() {});
                                        }
                                      }
                                    }
                                  }

                                  FFAppState().answerResult = '¡¡CORRECTO!!';
                                  safeSetState(() {});
                                } else {
                                  FFAppState().answerResult = '¡¡FALLASTE!!';
                                  safeSetState(() {});
                                }

                                _model.timerController.onStopTimer();
                                FFAppState().waitingNextTurn = true;
                                safeSetState(() {});
                              }
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 5.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                if ((FFAppState().selectedAnswer == 'A') &&
                                    (FFAppState().answerResult ==
                                        '¡¡FALLASTE!!'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Copilot_20260618_063912.png',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((FFAppState().selectedAnswer == 'A') &&
                                    (FFAppState().answerResult ==
                                        '¡¡CORRECTO!!'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Copilot_20260618_063817.png',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'A',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .onPrimary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ),
                                        if (FFAppState().StartGame)
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              valueOrDefault<String>(
                                                FFAppState()
                                                    .gameQuestions
                                                    .elementAtOrNull(FFAppState()
                                                        .currentQuestionIndex)
                                                    ?.optionA,
                                                '...',
                                              ),
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().StartGame == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 0.0, 50.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().StartGame == true) {
                              if (FFAppState().waitingNextTurn == false) {
                                FFAppState().selectedAnswer = 'B';
                                safeSetState(() {});
                                _model.isCorrectB =
                                    await actions.isCorrectAnswer(
                                  FFAppState()
                                      .gameQuestions
                                      .elementAtOrNull(
                                          FFAppState().currentQuestionIndex)!
                                      .optionB,
                                  FFAppState()
                                      .gameQuestions
                                      .elementAtOrNull(
                                          FFAppState().currentQuestionIndex)!
                                      .correctAnswer,
                                );
                                if (_model.isCorrectB == true) {
                                  if (FFAppState().currentPlayer == 1) {
                                    FFAppState().player1Score =
                                        FFAppState().player1Score + 1;
                                    safeSetState(() {});
                                  } else {
                                    if (FFAppState().currentPlayer == 2) {
                                      FFAppState().player2Score =
                                          FFAppState().player2Score + 1;
                                      safeSetState(() {});
                                    } else {
                                      if (FFAppState().currentPlayer == 3) {
                                        FFAppState().player3Score =
                                            FFAppState().player3Score + 1;
                                        safeSetState(() {});
                                      } else {
                                        if (FFAppState().currentPlayer == 4) {
                                          FFAppState().player4Score =
                                              FFAppState().player4Score + 1;
                                          safeSetState(() {});
                                        }
                                      }
                                    }
                                  }

                                  FFAppState().answerResult = '¡¡CORRECTO!!';
                                  safeSetState(() {});
                                } else {
                                  FFAppState().answerResult = '¡¡FALLASTE!!';
                                  safeSetState(() {});
                                }

                                _model.timerController.onStopTimer();
                                FFAppState().waitingNextTurn = true;
                                safeSetState(() {});
                              }
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            width: 100.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 5.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                if ((FFAppState().selectedAnswer == 'B') &&
                                    (FFAppState().answerResult ==
                                        '¡¡FALLASTE!!'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Copilot_20260618_063912.png',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((FFAppState().selectedAnswer == 'B') &&
                                    (FFAppState().answerResult ==
                                        '¡¡CORRECTO!!'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Copilot_20260618_063817.png',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'B',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .onPrimary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ),
                                        if (FFAppState().StartGame)
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              valueOrDefault<String>(
                                                FFAppState()
                                                    .gameQuestions
                                                    .elementAtOrNull(FFAppState()
                                                        .currentQuestionIndex)
                                                    ?.optionB,
                                                '...',
                                              ),
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().StartGame == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 0.0, 50.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().StartGame == true) {
                              if (FFAppState().waitingNextTurn == false) {
                                FFAppState().selectedAnswer = 'C';
                                safeSetState(() {});
                                _model.isCorrectC =
                                    await actions.isCorrectAnswer(
                                  FFAppState()
                                      .gameQuestions
                                      .elementAtOrNull(
                                          FFAppState().currentQuestionIndex)!
                                      .optionC,
                                  FFAppState()
                                      .gameQuestions
                                      .elementAtOrNull(
                                          FFAppState().currentQuestionIndex)!
                                      .correctAnswer,
                                );
                                if (_model.isCorrectC == true) {
                                  if (FFAppState().currentPlayer == 1) {
                                    FFAppState().player1Score =
                                        FFAppState().player1Score + 1;
                                    safeSetState(() {});
                                  } else {
                                    if (FFAppState().currentPlayer == 2) {
                                      FFAppState().player2Score =
                                          FFAppState().player2Score + 1;
                                      safeSetState(() {});
                                    } else {
                                      if (FFAppState().currentPlayer == 3) {
                                        FFAppState().player3Score =
                                            FFAppState().player3Score + 1;
                                        safeSetState(() {});
                                      } else {
                                        if (FFAppState().currentPlayer == 4) {
                                          FFAppState().player4Score =
                                              FFAppState().player4Score + 1;
                                          safeSetState(() {});
                                        }
                                      }
                                    }
                                  }

                                  FFAppState().answerResult = '¡¡CORRECTO!!';
                                  safeSetState(() {});
                                } else {
                                  FFAppState().answerResult = '¡¡FALLASTE!!';
                                  safeSetState(() {});
                                }

                                _model.timerController.onStopTimer();
                                FFAppState().waitingNextTurn = true;
                                safeSetState(() {});
                              }
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            width: 100.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 5.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                if ((FFAppState().selectedAnswer == 'C') &&
                                    (FFAppState().answerResult ==
                                        '¡¡FALLASTE!!'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Copilot_20260618_063912.png',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((FFAppState().selectedAnswer == 'C') &&
                                    (FFAppState().answerResult ==
                                        '¡¡CORRECTO!!'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Copilot_20260618_063817.png',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'C',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .onPrimary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ),
                                        if (FFAppState().StartGame)
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              valueOrDefault<String>(
                                                FFAppState()
                                                    .gameQuestions
                                                    .elementAtOrNull(FFAppState()
                                                        .currentQuestionIndex)
                                                    ?.optionC,
                                                '...',
                                              ),
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().StartGame == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 0.0, 50.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().StartGame == true) {
                              if (FFAppState().waitingNextTurn == false) {
                                FFAppState().selectedAnswer = 'D';
                                safeSetState(() {});
                                _model.isCorrectD =
                                    await actions.isCorrectAnswer(
                                  FFAppState()
                                      .gameQuestions
                                      .elementAtOrNull(
                                          FFAppState().currentQuestionIndex)!
                                      .optionD,
                                  FFAppState()
                                      .gameQuestions
                                      .elementAtOrNull(
                                          FFAppState().currentQuestionIndex)!
                                      .correctAnswer,
                                );
                                if (_model.isCorrectD == true) {
                                  if (FFAppState().currentPlayer == 1) {
                                    FFAppState().player1Score =
                                        FFAppState().player1Score + 1;
                                    safeSetState(() {});
                                  } else {
                                    if (FFAppState().currentPlayer == 2) {
                                      FFAppState().player2Score =
                                          FFAppState().player2Score + 1;
                                      safeSetState(() {});
                                    } else {
                                      if (FFAppState().currentPlayer == 3) {
                                        FFAppState().player3Score =
                                            FFAppState().player3Score + 1;
                                        safeSetState(() {});
                                      } else {
                                        if (FFAppState().currentPlayer == 4) {
                                          FFAppState().player4Score =
                                              FFAppState().player4Score + 1;
                                          safeSetState(() {});
                                        }
                                      }
                                    }
                                  }

                                  FFAppState().answerResult = '¡¡CORRECTO!!';
                                  safeSetState(() {});
                                } else {
                                  FFAppState().answerResult = '¡¡FALLASTE!!';
                                  safeSetState(() {});
                                }

                                _model.timerController.onStopTimer();
                                FFAppState().waitingNextTurn = true;
                                safeSetState(() {});
                              }
                            }

                            safeSetState(() {});
                          },
                          child: Container(
                            width: 100.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 5.0,
                              ),
                            ),
                            child: Stack(
                              children: [
                                if ((FFAppState().selectedAnswer == 'D') &&
                                    (FFAppState().answerResult ==
                                        '¡¡FALLASTE!!'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Copilot_20260618_063912.png',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((FFAppState().selectedAnswer == 'D') &&
                                    (FFAppState().answerResult ==
                                        '¡¡CORRECTO!!'))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Copilot_20260618_063817.png',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'D',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .onPrimary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ),
                                        if (FFAppState().StartGame)
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              valueOrDefault<String>(
                                                FFAppState()
                                                    .gameQuestions
                                                    .elementAtOrNull(FFAppState()
                                                        .currentQuestionIndex)
                                                    ?.optionD,
                                                '...',
                                              ),
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                    lineHeight: 1.5,
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
