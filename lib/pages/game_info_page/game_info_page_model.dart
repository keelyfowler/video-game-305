import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'game_info_page_widget.dart' show GameInfoPageWidget;
import 'package:flutter/material.dart';

class GameInfoPageModel extends FlutterFlowModel<GameInfoPageWidget> {
  ///  Local state fields for this page.

  int? iconClicked;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getGameDetailsKF)] action in GameInfoPage widget.
  ApiCallResponse? gameDetailsResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
