import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> searchResultsKF = [];
  void addToSearchResultsKF(dynamic item) => searchResultsKF.add(item);
  void removeFromSearchResultsKF(dynamic item) => searchResultsKF.remove(item);
  void removeAtIndexFromSearchResultsKF(int index) =>
      searchResultsKF.removeAt(index);
  void insertAtIndexInSearchResultsKF(int index, dynamic item) =>
      searchResultsKF.insert(index, item);
  void updateSearchResultsKFAtIndex(int index, Function(dynamic) updateFn) =>
      searchResultsKF[index] = updateFn(searchResultsKF[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (SearchGamesKF)] action in TextField widget.
  ApiCallResponse? apiResult7u6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
