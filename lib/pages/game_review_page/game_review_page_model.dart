import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'game_review_page_widget.dart' show GameReviewPageWidget;
import 'package:flutter/material.dart';

class GameReviewPageModel extends FlutterFlowModel<GameReviewPageWidget> {
  ///  Local state fields for this page.

  int? starRating = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
