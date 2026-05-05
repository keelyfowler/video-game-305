import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_game_option_model.dart';
export 'view_game_option_model.dart';

/// Create a bottom sheet component called ReviewOptionsSheet.
///
/// Create a bottom sheet component called ReviewOptionsSheet. Background
/// color #3A3D3D at 80% opacity, border radius 24 on all corners. Small
/// centered drag handle at top (width 40, height 4, color #9CC5A1, border
/// radius 2, 12px top padding). Below that 20px padding on sides, two square
/// buttons side by side in a Row with 12px gap: left button "View Game" color
/// #177BDD, right button "View Profile" color #57886C. Both buttons equal
/// width, height 80, border radius 16, white semi-bold text. 24px bottom
/// padding.
class ViewGameOptionWidget extends StatefulWidget {
  const ViewGameOptionWidget({
    super.key,
    required this.gameId,
  });

  final String? gameId;

  @override
  State<ViewGameOptionWidget> createState() => _ViewGameOptionWidgetState();
}

class _ViewGameOptionWidgetState extends State<ViewGameOptionWidget> {
  late ViewGameOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewGameOptionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xCC3A3D3D),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Container(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 40.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF9CC5A1),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'VIEW_GAME_OPTION_VIEW_GAME_BTN_ON_TAP');
                        logFirebaseEvent('Button_backend_call');
                        _model.aPIsearchNameResult =
                            await SearchGamesKFCall.call(
                          query: widget.gameId,
                        );

                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          GameInfoPageWidget.routeName,
                          queryParameters: {
                            'gameName': serializeParam(
                              getJsonField(
                                (_model.aPIsearchNameResult?.jsonBody ?? ''),
                                r'''$.games[0].name''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'gameSummary': serializeParam(
                              getJsonField(
                                (_model.aPIsearchNameResult?.jsonBody ?? ''),
                                r'''$.games[0].summary''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'gameCover': serializeParam(
                              getJsonField(
                                (_model.aPIsearchNameResult?.jsonBody ?? ''),
                                r'''$.games[0].cover.url''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'gameId': serializeParam(
                              getJsonField(
                                (_model.aPIsearchNameResult?.jsonBody ?? ''),
                                r'''$.games[0].id''',
                              ).toString(),
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        safeSetState(() {});
                      },
                      text: 'View Game',
                      options: FFButtonOptions(
                        height: 80.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF4C6959),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
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
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
