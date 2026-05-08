import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_view_widget.dart' show ProfileViewWidget;
import 'package:flutter/material.dart';

class ProfileViewModel extends FlutterFlowModel<ProfileViewWidget> {
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

  ///  State fields for stateful widgets in this page.

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
