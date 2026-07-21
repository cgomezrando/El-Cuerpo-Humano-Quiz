import '/components/button/button_widget.dart';
import '/components/rule_item/rule_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_rules_model.dart';
export 'game_rules_model.dart';

class GameRulesWidget extends StatefulWidget {
  const GameRulesWidget({super.key});

  static String routeName = 'GameRules';
  static String routePath = '/gameRules';

  @override
  State<GameRulesWidget> createState() => _GameRulesWidgetState();
}

class _GameRulesWidgetState extends State<GameRulesWidget> {
  late GameRulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameRulesModel());
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
        backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
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
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: Container(
                              width: 64.0,
                              height: 64.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 16.0,
                                    color:
                                        FlutterFlowTheme.of(context).primary30,
                                    offset: Offset(
                                      0.0,
                                      8.0,
                                    ),
                                    spreadRadius: 0.0,
                                  )
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).secondary
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(1.0, 1.0),
                                  end: AlignmentDirectional(-1.0, -1.0),
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.hub,
                                color: FlutterFlowTheme.of(context).onSurface,
                                size: 36.0,
                              ),
                            ),
                          ),
                          Text(
                            'Reglas del Juego',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                  lineHeight: 1.25,
                                ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                      Divider(
                        height: 16.0,
                        thickness: 1.0,
                        indent: 0.0,
                        endIndent: 0.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.ruleItemModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: RuleItemWidget(
                              bgColor: FlutterFlowTheme.of(context).primary15,
                              description:
                                  'PASO 1 — Elige cuántos jugadores van a jugar (de 1 a 4 jugadores).\nPASO 2 — Escribe el nombre de cada jugador que va a participar en el quiz.',
                              icon: Icon(
                                Icons.person_2,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 22.0,
                              ),
                              iconColor: FlutterFlowTheme.of(context).primary,
                              title: 'Configura los Jugadores',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.ruleItemModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: RuleItemWidget(
                              bgColor: FlutterFlowTheme.of(context).primary15,
                              description:
                                  'PASO 3 — Pulsa \"▶️ EMPIEZA LA PARTIDA\"\nPASO 4 — Responde cada pregunta en 20 segundos. Selecciona la opción correcta (A, B, C o D). El cronómetro cuenta hacia atrás.\nPASO 5 — Después de responder, verás si tu respuesta fue correcta o incorrecta.\nPASO 6 — Presiona el botón ➡️ para pasar a la siguiente pregunta. El turno pasará al siguiente jugador.\nPASO 7 —  Una vez termines el juego, pulsa 🏆 para ver los resultados con la puntuación de cada jugador. Puedes jugar de nuevo con los mismos jugadores.\n\nEn cualquier momento puedes pulsar 🏠 para abandonar el juego y volver al menú principal.',
                              icon: Icon(
                                Icons.timer_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 22.0,
                              ),
                              iconColor: FlutterFlowTheme.of(context).primary,
                              title: 'Empieza el juego y continúa los turnos',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.ruleItemModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: RuleItemWidget(
                              bgColor: FlutterFlowTheme.of(context).secondary15,
                              description:
                                  'Gana quien acumule más puntos al finalizar sus 20 preguntas.',
                              icon: Icon(
                                Icons.psychology_rounded,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 22.0,
                              ),
                              iconColor: FlutterFlowTheme.of(context).secondary,
                              title: 'Puntuación',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.ruleItemModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: RuleItemWidget(
                              bgColor: FlutterFlowTheme.of(context).accent15,
                              description:
                                  'Las preguntas se seleccionan al azar de una base de datos con cientos de preguntas',
                              icon: Icon(
                                Icons.casino_rounded,
                                color: Color(0xFFB2A000),
                                size: 22.0,
                              ),
                              iconColor: Color(0xFFB2A000),
                              title: 'Aleatoriedad',
                            ),
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 0.0, 50.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().InstructionsDuringGame == true) {
                              context.pushNamed(QuizScreenWidget.routeName);
                            } else {
                              context.safePop();
                            }
                          },
                          child: wrapWithModel(
                            model: _model.buttonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ButtonWidget(
                              iconPresent: false,
                              iconEndPresent: false,
                              content: '¡Entendido!',
                              variant: 'primary',
                              size: 'large',
                              fullWidth: false,
                              loading: false,
                              disabled: false,
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
