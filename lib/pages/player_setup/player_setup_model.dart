import '/backend/schema/structs/index.dart';
import '/components/button/button_widget.dart';
import '/components/player_count_option/player_count_option_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'player_setup_widget.dart' show PlayerSetupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerSetupModel extends FlutterFlowModel<PlayerSetupWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PlayerCountOption.
  late PlayerCountOptionModel playerCountOptionModel1;
  // Model for PlayerCountOption.
  late PlayerCountOptionModel playerCountOptionModel2;
  // Model for PlayerCountOption.
  late PlayerCountOptionModel playerCountOptionModel3;
  // Model for PlayerCountOption.
  late PlayerCountOptionModel playerCountOptionModel4;
  // State field(s) for InputJugador1 widget.
  FocusNode? inputJugador1FocusNode;
  TextEditingController? inputJugador1TextController;
  String? Function(BuildContext, String?)? inputJugador1TextControllerValidator;
  // State field(s) for InputJugador2 widget.
  FocusNode? inputJugador2FocusNode;
  TextEditingController? inputJugador2TextController;
  String? Function(BuildContext, String?)? inputJugador2TextControllerValidator;
  // State field(s) for InputJugador3 widget.
  FocusNode? inputJugador3FocusNode;
  TextEditingController? inputJugador3TextController;
  String? Function(BuildContext, String?)? inputJugador3TextControllerValidator;
  // State field(s) for InputJugador4 widget.
  FocusNode? inputJugador4FocusNode;
  TextEditingController? inputJugador4TextController;
  String? Function(BuildContext, String?)? inputJugador4TextControllerValidator;
  // Model for Button.
  late ButtonModel buttonModel;
  // Stores action output result for [Custom Action - validatePlayerNames] action in Button widget.
  bool? isValidPlayers;
  // Stores action output result for [Custom Action - loadQuestionsFromJson] action in Button widget.
  List<QuestionStruct>? loadedQuestions;

  @override
  void initState(BuildContext context) {
    playerCountOptionModel1 =
        createModel(context, () => PlayerCountOptionModel());
    playerCountOptionModel2 =
        createModel(context, () => PlayerCountOptionModel());
    playerCountOptionModel3 =
        createModel(context, () => PlayerCountOptionModel());
    playerCountOptionModel4 =
        createModel(context, () => PlayerCountOptionModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    playerCountOptionModel1.dispose();
    playerCountOptionModel2.dispose();
    playerCountOptionModel3.dispose();
    playerCountOptionModel4.dispose();
    inputJugador1FocusNode?.dispose();
    inputJugador1TextController?.dispose();

    inputJugador2FocusNode?.dispose();
    inputJugador2TextController?.dispose();

    inputJugador3FocusNode?.dispose();
    inputJugador3TextController?.dispose();

    inputJugador4FocusNode?.dispose();
    inputJugador4TextController?.dispose();

    buttonModel.dispose();
  }
}
