import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'game_info_page_model.dart';
export 'game_info_page_model.dart';

/// Create a Game Info page.
///
/// Use colors:
/// - Background #4A4D4D
/// - Buttons #177BDD
/// - Secondary button #57886C
/// - Text accent #9CC5A1
///
/// Top:
/// - Large game image
/// - Game title in #9CC5A1
///
/// Below:
/// - Description
/// - Genre and platform
///
/// Add two buttons:
/// - "Write a Review" (#177BDD)
/// - "See All Reviews" (#57886C)
///
/// Write opens bottom popup.
/// See All navigates to reviews page.
///
/// Use clean spacing and rounded buttons.
///
/// Log "game_info_viewed" on load.
///
/// No bottom navigation.
class GameInfoPageWidget extends StatefulWidget {
  const GameInfoPageWidget({
    super.key,
    required this.gameName,
    required this.gameSummary,
    required this.gameCover,
    required this.gameId,
  });

  final String? gameName;
  final String? gameSummary;
  final String? gameCover;
  final String? gameId;

  static String routeName = 'GameInfoPage';
  static String routePath = '/gameInfoPage';

  @override
  State<GameInfoPageWidget> createState() => _GameInfoPageWidgetState();
}

class _GameInfoPageWidgetState extends State<GameInfoPageWidget> {
  late GameInfoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameInfoPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'GameInfoPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GAME_INFO_GameInfoPage_ON_INIT_STATE');
      logFirebaseEvent('GameInfoPage_backend_call');
      _model.gameDetailsResult = await GetGameDetailsKFCall.call(
        gameID: widget.gameId,
      );

      logFirebaseEvent('GameInfoPage_firestore_query');
      _model.favoriteCheckVisuale = await queryFavoritesRecordOnce(
        queryBuilder: (favoritesRecord) => favoritesRecord
            .where(
              'user_ref',
              isEqualTo: currentUserReference,
            )
            .where(
              'game_id',
              isEqualTo: widget.gameId,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.favoriteCheckVisuale != null) {
        logFirebaseEvent('GameInfoPage_update_page_state');
        _model.iconClicked = 1;
        safeSetState(() {});
      } else {
        logFirebaseEvent('GameInfoPage_update_page_state');
        _model.iconClicked = 0;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF4A4D4D),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xFF9CC5A1),
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('GAME_INFO_arrow_back_ios_rounded_ICN_ON_');
                logFirebaseEvent('IconButton_navigate_back');
                context.safePop();
              },
            ),
            title: Text(
              valueOrDefault<String>(
                widget.gameName,
                'Game',
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Color(0xFF9CC5A1),
                    fontSize: 28.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 5.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 319.0,
              child: Stack(
                alignment: AlignmentDirectional(0.0, 1.0),
                children: [
                  Container(
                    width: double.infinity,
                    height: 300.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Color(0xFF4A4D4D)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.07, -1.0),
                        end: AlignmentDirectional(-0.07, 1.0),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.gameCover!,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0x7E445552),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: GradientText(
                            valueOrDefault<String>(
                              widget.gameName,
                              'gameName',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  font: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontStyle,
                                  lineHeight: 1.2,
                                ),
                            colors: [
                              Color(0xFF4C6959),
                              FlutterFlowTheme.of(context).primary
                            ],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Opacity(
                                opacity: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x7E445552),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '2024',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.01, -1.04),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0x7E445552),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: FlutterFlowIconButton(
                        borderRadius: 22.0,
                        hoverIconColor: Color(0xFF552E2E),
                        icon: Icon(
                          Icons.favorite,
                          color: _model.iconClicked == 1
                              ? Color(0xFFFF7CE8)
                              : Colors.black,
                          size: 44.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'GAME_INFO_PAGE_PAGE_favorite_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_firestore_query');
                          _model.favoriteCheck = await queryFavoritesRecordOnce(
                            queryBuilder: (favoritesRecord) => favoritesRecord
                                .where(
                                  'user_ref',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'game_id',
                                  isEqualTo: widget.gameId,
                                ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          if (_model.favoriteCheck != null) {
                            logFirebaseEvent('IconButton_backend_call');
                            await _model.favoriteCheck!.reference.delete();
                            logFirebaseEvent('IconButton_update_page_state');
                            _model.iconClicked = 0;
                            safeSetState(() {});
                          } else {
                            logFirebaseEvent('IconButton_backend_call');

                            await FavoritesRecord.collection
                                .doc('${currentUserUid}_${widget.gameId}')
                                .set(createFavoritesRecordData(
                                  gameName: widget.gameName,
                                  gameDesc: widget.gameSummary,
                                  userRef: currentUserReference,
                                  gamePic: widget.gameCover,
                                  gameId: widget.gameId,
                                  userId: currentUserUid,
                                ));
                            logFirebaseEvent('IconButton_update_page_state');
                            _model.iconClicked = 1;
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF9CC5A1),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.gameSummary,
                              'gameSummary',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.dmSans(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFDDDDDD),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.6,
                                ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Details',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF9CC5A1),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3A3D3D),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'GENRE',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF9CC5A1),
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            getJsonField(
                                              (_model.gameDetailsResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.game.genres[0].name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3A3D3D),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'PLATFORM',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF9CC5A1),
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            getJsonField(
                                              (_model.gameDetailsResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.game.platforms[0].name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3A3D3D),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'DEVELOPER',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF9CC5A1),
                                                  letterSpacing: 1.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            getJsonField(
                                              (_model.gameDetailsResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.game.developer''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Screenshots',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF9CC5A1),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      getJsonField(
                                        (_model.gameDetailsResult?.jsonBody ??
                                            ''),
                                        r'''$.game.screenshots[0].url''',
                                      ).toString(),
                                      width: 140.0,
                                      height: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      getJsonField(
                                        (_model.gameDetailsResult?.jsonBody ??
                                            ''),
                                        r'''$.game.screenshots[1].url''',
                                      ).toString(),
                                      width: 140.0,
                                      height: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      getJsonField(
                                        (_model.gameDetailsResult?.jsonBody ??
                                            ''),
                                        r'''$.game.screenshots[2].url''',
                                      ).toString(),
                                      width: 140.0,
                                      height: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      getJsonField(
                                        (_model.gameDetailsResult?.jsonBody ??
                                            ''),
                                        r'''$.game.screenshots[3].url''',
                                      ).toString(),
                                      width: 140.0,
                                      height: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      getJsonField(
                                        (_model.gameDetailsResult?.jsonBody ??
                                            ''),
                                        r'''$.game.screenshots[4].url''',
                                      ).toString(),
                                      width: 140.0,
                                      height: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      getJsonField(
                                        (_model.gameDetailsResult?.jsonBody ??
                                            ''),
                                        r'''$.game.screenshots[5].url''',
                                      ).toString(),
                                      width: 140.0,
                                      height: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'GAME_INFO_WRITE_A_REVIEW_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                GameReviewPageWidget.routeName,
                                queryParameters: {
                                  'gameName': serializeParam(
                                    widget.gameName,
                                    ParamType.String,
                                  ),
                                  'gameCover': serializeParam(
                                    widget.gameCover,
                                    ParamType.String,
                                  ),
                                  'gameId': serializeParam(
                                    widget.gameId,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Write a Review',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 54.0,
                              padding: EdgeInsets.all(8.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFAC9A5E),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'GAME_INFO_SEE_ALL_REVIEWS_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                AllReviewsPageWidget.routeName,
                                queryParameters: {
                                  'gameId': serializeParam(
                                    widget.gameId,
                                    ParamType.String,
                                  ),
                                  'gameName': serializeParam(
                                    widget.gameName,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'See All Reviews',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 54.0,
                              padding: EdgeInsets.all(8.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF57886C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ]
                        .divide(SizedBox(height: 11.0))
                        .addToStart(SizedBox(height: 24.0))
                        .addToEnd(SizedBox(height: 32.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
