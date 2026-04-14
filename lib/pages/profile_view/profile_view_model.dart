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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
