import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'game_info_page_widget.dart' show GameInfoPageWidget;
import 'package:flutter/material.dart';

class GameInfoPageModel extends FlutterFlowModel<GameInfoPageWidget> {
  ///  Local state fields for this page.

  int? iconClicked;

  String gameName = 'Loading...';

  String gameDescr = 'Loading...';

  String? gameImage;

  String gameGenre = 'Loading...';

  String gameDev = 'Loading...';

  String gamePlatform = 'Loading...';

  String gameReleased = 'Loading...';

  double? gameRating;

  List<String> gameScreenshots = [];
  void addToGameScreenshots(String item) => gameScreenshots.add(item);
  void removeFromGameScreenshots(String item) => gameScreenshots.remove(item);
  void removeAtIndexFromGameScreenshots(int index) =>
      gameScreenshots.removeAt(index);
  void insertAtIndexInGameScreenshots(int index, String item) =>
      gameScreenshots.insert(index, item);
  void updateGameScreenshotsAtIndex(int index, Function(String) updateFn) =>
      gameScreenshots[index] = updateFn(gameScreenshots[index]);

  int? reviewCount;

  bool isLoading = true;

  bool isLoadingAI = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getGameDetailsKF)] action in GameInfoPage widget.
  ApiCallResponse? gameDetailsResult;
  // Stores action output result for [Firestore Query - Query a collection] action in GameInfoPage widget.
  FavoritesRecord? favoriteCheckVisuale;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  FavoritesRecord? favoriteCheck;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
