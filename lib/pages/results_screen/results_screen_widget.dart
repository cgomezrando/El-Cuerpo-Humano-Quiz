import '/backend/schema/structs/index.dart';
import '/components/button/button_widget.dart';
import '/components/score_card/score_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'results_screen_model.dart';
export 'results_screen_model.dart';

class ResultsScreenWidget extends StatefulWidget {
  const ResultsScreenWidget({super.key});

  static String routeName = 'ResultsScreen';
  static String routePath = '/resultsScreen';

  @override
  State<ResultsScreenWidget> createState() => _ResultsScreenWidgetState();
}

class _ResultsScreenWidgetState extends State<ResultsScreenWidget> {
  late ResultsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultsScreenModel());
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
          constraints: BoxConstraints(
            minHeight: 2500.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Designer_(25).png',
              ).image,
            ),
          ),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
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
                              FFAppState().InstructionsDuringGame = false;
                              FFAppState().currentQuestionIndex = 0;
                              FFAppState().currentPlayer = 1;
                              FFAppState().currentPlayerQuestion = 1;
                              FFAppState().questionTimer = 20;
                              FFAppState().waitingNextTurn = false;
                              FFAppState().timerExpired = false;
                              FFAppState().SavedTime = 0;
                              safeSetState(() {});

                              context.pushNamed(HomeScreenWidget.routeName);
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
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
                                  width: 4.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.home,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 80.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '¡JUEGO TERMINADO!',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).onPrimary,
                                fontSize: 45.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w900,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                                lineHeight: 1.25,
                              ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.scoreCard1Model,
                                updateCallback: () => safeSetState(() {}),
                                child: ScoreCardWidget(
                                  name: FFAppState().player1Name,
                                  score: FFAppState().player1Score.toString(),
                                  rank: '1',
                                ),
                              ),
                            ),
                            if (FFAppState().playerCount >= 2)
                              wrapWithModel(
                                model: _model.scoreCard2Model,
                                updateCallback: () => safeSetState(() {}),
                                child: ScoreCardWidget(
                                  name: FFAppState().player2Name,
                                  score: FFAppState().player2Score.toString(),
                                  rank: '2',
                                ),
                              ),
                            if (FFAppState().playerCount >= 3)
                              wrapWithModel(
                                model: _model.scoreCard3Model,
                                updateCallback: () => safeSetState(() {}),
                                child: ScoreCardWidget(
                                  name: FFAppState().player3Name,
                                  score: FFAppState().player3Score.toString(),
                                  rank: '3',
                                ),
                              ),
                            if (FFAppState().playerCount >= 4)
                              wrapWithModel(
                                model: _model.scoreCard4Model,
                                updateCallback: () => safeSetState(() {}),
                                child: ScoreCardWidget(
                                  name: FFAppState().player4Name,
                                  score: FFAppState().player4Score.toString(),
                                  rank: '4',
                                ),
                              ),
                          ],
                        ),
                        if (FFAppState().playerCount >= 2)
                          Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20.0,
                                  color: FlutterFlowTheme.of(context).primary40,
                                  offset: Offset(
                                    0.0,
                                    10.0,
                                  ),
                                  spreadRadius: 0.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(24.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).tertiary,
                                width: 5.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            if (FFAppState().winnerName !=
                                                'EMPATE')
                                              Text(
                                                'EL GANADOR ES ${FFAppState().winnerName}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelSmall
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 50.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                      lineHeight: 1.2,
                                                    ),
                                              ),
                                            if (FFAppState().winnerName ==
                                                'EMPATE')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'EMPATE',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 50.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().selectedAnswer = '';
                                  safeSetState(() {});
                                  FFAppState().answerResult = '';
                                  safeSetState(() {});
                                  FFAppState().timerExpired = false;
                                  safeSetState(() {});
                                  FFAppState().waitingNextTurn = false;
                                  safeSetState(() {});
                                  FFAppState().questionTimer = 20;
                                  safeSetState(() {});
                                  FFAppState().currentPlayerQuestion = 1;
                                  safeSetState(() {});
                                  FFAppState().player1Score = 0;
                                  safeSetState(() {});
                                  FFAppState().player2Score = 0;
                                  safeSetState(() {});
                                  FFAppState().player3Score = 0;
                                  safeSetState(() {});
                                  FFAppState().player4Score = 0;
                                  safeSetState(() {});
                                  FFAppState().currentQuestionIndex = 0;
                                  safeSetState(() {});
                                  FFAppState().currentPlayer = 1;
                                  safeSetState(() {});
                                  FFAppState().winnerName = '';
                                  safeSetState(() {});
                                  _model.loadedQuestions =
                                      await actions.loadQuestionsFromJson();
                                  FFAppState().gameQuestions = _model
                                      .loadedQuestions!
                                      .toList()
                                      .cast<QuestionStruct>();
                                  safeSetState(() {});
                                  FFAppState().StartGame = false;
                                  safeSetState(() {});

                                  context.goNamed(QuizScreenWidget.routeName);

                                  safeSetState(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.buttonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ButtonWidget(
                                    iconPresent: false,
                                    iconEndPresent: false,
                                    content: 'JUGAR DE NUEVO',
                                    variant: 'primary',
                                    size: 'large',
                                    fullWidth: true,
                                    loading: false,
                                    disabled: false,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
