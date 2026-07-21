import '/components/button/button_widget.dart';
import '/components/rule_item/rule_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'game_rules_widget.dart' show GameRulesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GameRulesModel extends FlutterFlowModel<GameRulesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RuleItem.
  late RuleItemModel ruleItemModel1;
  // Model for RuleItem.
  late RuleItemModel ruleItemModel2;
  // Model for RuleItem.
  late RuleItemModel ruleItemModel3;
  // Model for RuleItem.
  late RuleItemModel ruleItemModel4;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    ruleItemModel1 = createModel(context, () => RuleItemModel());
    ruleItemModel2 = createModel(context, () => RuleItemModel());
    ruleItemModel3 = createModel(context, () => RuleItemModel());
    ruleItemModel4 = createModel(context, () => RuleItemModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    ruleItemModel1.dispose();
    ruleItemModel2.dispose();
    ruleItemModel3.dispose();
    ruleItemModel4.dispose();
    buttonModel.dispose();
  }
}
