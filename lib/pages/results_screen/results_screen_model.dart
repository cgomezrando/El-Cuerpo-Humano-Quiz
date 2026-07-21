import '/backend/schema/structs/index.dart';
import '/components/button/button_widget.dart';
import '/components/score_card/score_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'results_screen_widget.dart' show ResultsScreenWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultsScreenModel extends FlutterFlowModel<ResultsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ScoreCard1.
  late ScoreCardModel scoreCard1Model;
  // Model for ScoreCard2.
  late ScoreCardModel scoreCard2Model;
  // Model for ScoreCard3.
  late ScoreCardModel scoreCard3Model;
  // Model for ScoreCard4.
  late ScoreCardModel scoreCard4Model;
  // Model for Button.
  late ButtonModel buttonModel;
  // Stores action output result for [Custom Action - loadQuestionsFromJson] action in Button widget.
  List<QuestionStruct>? loadedQuestions;

  @override
  void initState(BuildContext context) {
    scoreCard1Model = createModel(context, () => ScoreCardModel());
    scoreCard2Model = createModel(context, () => ScoreCardModel());
    scoreCard3Model = createModel(context, () => ScoreCardModel());
    scoreCard4Model = createModel(context, () => ScoreCardModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    scoreCard1Model.dispose();
    scoreCard2Model.dispose();
    scoreCard3Model.dispose();
    scoreCard4Model.dispose();
    buttonModel.dispose();
  }
}
