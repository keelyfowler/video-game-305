import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/components/recommendation_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recommended_games_model.dart';
export 'recommended_games_model.dart';

/// Create a dark mobile screen.
///
/// Title: Recommended For You
///
/// Section:
/// Your Highly Rated Games
/// Show 3 game cards with image, title, and stars
///
/// Button:
/// Ask AI
/// Color: #57886C
///
/// Section:
/// Recommended Games
///
/// List items:
///
/// Image
///
/// Title
///
/// Genre
///
/// Description
///
/// Button: View Game
///
/// Use simple layout and spacing.
class RecommendedGamesWidget extends StatefulWidget {
  const RecommendedGamesWidget({super.key});

  static String routeName = 'RecommendedGames';
  static String routePath = '/recommendedGames';

  @override
  State<RecommendedGamesWidget> createState() => _RecommendedGamesWidgetState();
}

class _RecommendedGamesWidgetState extends State<RecommendedGamesWidget> {
  late RecommendedGamesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendedGamesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RecommendedGames'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FavoritesRecord>>(
      stream: queryFavoritesRecord(
        queryBuilder: (favoritesRecord) => favoritesRecord.where(
          'user_ref',
          isEqualTo: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF4A4D4D),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<FavoritesRecord> recommendedGamesFavoritesRecordList =
            snapshot.data!;

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
                title: Text(
                  'Recommended Games',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: Color(0xFF9CC5A1),
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 5.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Favorited Games',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final favoriteItem =
                                        recommendedGamesFavoritesRecordList
                                            .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(favoriteItem.length,
                                                (favoriteItemIndex) {
                                          final favoriteItemItem =
                                              favoriteItem[favoriteItemIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.28,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.2,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      3.0,
                                                      -3.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF1F4F8),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    1.0,
                                                                    1.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
                                                              child: Text(
                                                                favoriteItemItem
                                                                    .gameName,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .urbanist(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .fade,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            favoriteItemItem
                                                                .gamePic,
                                                            width: 109.7,
                                                            height: 178.2,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 12.0)),
                                      ),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 36.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'RECOMMENDED_GAMES__ASK_A_I_FOR_A_RECOMME');
                                        logFirebaseEvent(
                                            'Button_update_page_state');
                                        _model.favoritesString =
                                            functions.joinGamesNames(
                                                recommendedGamesFavoritesRecordList
                                                    .toList());
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_a_i_agent');
                                        await callAiAgent(
                                          context: context,
                                          prompt:
                                              'Recommend 2 video games based on these favorites:${_model.favoritesString}',
                                          threadId: 'gameRecSession',
                                          agentCloudFunctionName: 'aIGameRec',
                                          provider: 'GOOGLE',
                                          agentJson:
                                              '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"aIGameRec\",\"key\":\"xpsgl\"},\"name\":\"AIGameRec\",\"description\":\"Recommends video games based on user favorites.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-flash\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":65535},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a video game recommendation assistant.\\n\\nGiven a list of favorite games, recommend exactly 3 new games.\\n\\nFavor the dominant genres, mechanics, or play styles from the favorites,\\nbut include some variety so not all recommendations feel identical.\\n\\nReturn all recommendations in ONE line separated by \\\"||\\\".\\n\\nFormat each recommendation exactly like:\\nGame Name|Genre|Short reason\\n\\nExample format:\\nGame1|Genre|Reason||Game2|Genre|Reason||Game3|Genre|Reason\\n\\nGuidelines:\\n- Keep each reason under 20 words\\n- Reference specific elements (combat, exploration, story, etc.)\\n- Avoid generic phrases like \\\"great game\\\"\\n- Do not include numbering or extra text\\n- Do not use \\\"||\\\" anywhere except as a separator\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
                                          responseType: 'PLAINTEXT',
                                        ).then((generatedText) {
                                          safeSetState(() =>
                                              _model.aiResult = generatedText);
                                        });

                                        logFirebaseEvent(
                                            'Button_update_page_state');
                                        _model.aiResponse = _model.aiResult;
                                        _model.recommendationsList = functions
                                            .splitStringToList(
                                                _model.aiResponse, '||')
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                      text: '✨  Ask AI For A Recommendation',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsets.all(8.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF4C6959),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.499,
                                  constraints: BoxConstraints(
                                    maxHeight: 500.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          3.0,
                                          3.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: IntrinsicWidth(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final rec = _model
                                                          .recommendationsList
                                                          .take(5)
                                                          .toList()
                                                          .take(5)
                                                          .toList();

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: rec.length,
                                                        itemBuilder: (context,
                                                            recIndex) {
                                                          final recItem =
                                                              rec[recIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                RecommendationCardWidget(
                                                              key: Key(
                                                                  'Key0sk_${recIndex}_of_${rec.length}'),
                                                              recommendation:
                                                                  recItem,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Container(
                                                    width: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF0F3460),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 7.0)),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
