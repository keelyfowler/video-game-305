import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recommendation_card_model.dart';
export 'recommendation_card_model.dart';

/// Create a component
/// Container:
/// - Full width
/// - Background color #4E6059 (slightly lighter than page background)
/// - Border radius 16 on all corners
/// - Padding 16 on all sides
/// - Subtle shadow (low elevation)
///
/// Inside use a Column aligned to start with 10px spacing.
///
/// Top Row:
/// - Left: small game controller icon (or emoji 🎮), size ~18
/// - Right: game name text (bold, white, font size ~16–18)
/// - 8px spacing between icon and text
///
/// Below:
/// - Genre text (smaller, muted green color #9CC5A1, font size ~12–13)
///
/// Below:
/// - Reason text (white, normal weight, font size ~13–14, max 2 lines,
/// slightly reduced opacity for softer look)
///
/// Spacing:
/// - 8px between title row and genre
/// - 6px between genre and reason
///
/// Overall:
/// - Clean, modern, minimal
/// - No buttons or interactions
/// - Designed to be stacked vertically with 12–16px spacing between cards
class RecommendationCardWidget extends StatefulWidget {
  const RecommendationCardWidget({
    super.key,
    this.recommendation,
  });

  final String? recommendation;

  @override
  State<RecommendationCardWidget> createState() =>
      _RecommendationCardWidgetState();
}

class _RecommendationCardWidgetState extends State<RecommendationCardWidget> {
  late RecommendationCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendationCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('RECOMMENDATION_CARD_RecommendationCard_O');
      logFirebaseEvent('RecommendationCard_update_component_stat');
      _model.recommendation = widget.recommendation!;
      safeSetState(() {});
    });

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF4E6059),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '🎮',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Expanded(
                  child: Text(
                    valueOrDefault<String>(
                      functions
                          .splitStringToList(widget.recommendation, '|')
                          .elementAtOrNull(0),
                      'Game Name',
                    ),
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.dmSans(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            Text(
              valueOrDefault<String>(
                functions
                    .splitStringToList(widget.recommendation, '|')
                    .elementAtOrNull(1),
                'Game Name',
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    font: GoogleFonts.dmSans(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodySmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
                    color: Color(0xFF9CC5A1),
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodySmall.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                  ),
            ),
            Text(
              valueOrDefault<String>(
                functions
                    .splitStringToList(widget.recommendation, '|')
                    .elementAtOrNull(2),
                'Game Name',
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    font: GoogleFonts.dmSans(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
                    color: Color(0xCCFFFFFF),
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                  ),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
