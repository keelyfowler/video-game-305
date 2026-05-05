import '/flutter_flow/flutter_flow_util.dart';
import 'recommended_games_widget.dart' show RecommendedGamesWidget;
import 'package:flutter/material.dart';

class RecommendedGamesModel extends FlutterFlowModel<RecommendedGamesWidget> {
  ///  Local state fields for this page.

  String? aiResponse;

  String? favoritesString;

  List<String> recommendationsList = [];
  void addToRecommendationsList(String item) => recommendationsList.add(item);
  void removeFromRecommendationsList(String item) =>
      recommendationsList.remove(item);
  void removeAtIndexFromRecommendationsList(int index) =>
      recommendationsList.removeAt(index);
  void insertAtIndexInRecommendationsList(int index, String item) =>
      recommendationsList.insert(index, item);
  void updateRecommendationsListAtIndex(int index, Function(String) updateFn) =>
      recommendationsList[index] = updateFn(recommendationsList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [AI Agent - Send Message to AIGameRec] action in Button widget.
  String? aiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
