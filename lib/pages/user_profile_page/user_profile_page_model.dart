import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_profile_page_widget.dart' show UserProfilePageWidget;
import 'package:flutter/material.dart';

class UserProfilePageModel extends FlutterFlowModel<UserProfilePageWidget> {
  ///  Local state fields for this page.

  String? displayName = 'Display Name';

  String? username = 'Username';

  String? bio = 'Short Bio';

  String? favoriteGame = 'Favorite Game';

  String? favoriteGenre = 'Favorite Genre';

  String? discordName = 'Discord Name';

  String? twitchName = 'Twitch Name';

  String? photoURL = '';

  FFUploadedFile? uploadDataProfilePic;

  int? followedUser = 0;

  String query = 'game_name';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in userProfilePage widget.
  FollowsRecord? existingFollowCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in followButton widget.
  FollowsRecord? existingFollow;
  // Stores action output result for [Backend Call - Create Document] action in followButton widget.
  FollowsRecord? followUser;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
