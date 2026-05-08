import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'n_p_ssurvey_model.dart';
export 'n_p_ssurvey_model.dart';

/// Create a mobile-friendly Net Promoter Score (NPS) survey component.
///
/// Use a centered card with rounded corners and padding. Card background
/// color: #9CC5A1. Text color: #4A4D4D.
///
/// Add a title: "How likely are you to recommend this app?" centered at the
/// top.
///
/// Below, create a horizontal row of 11 circular buttons labeled 0 to 10.
/// Buttons should be evenly spaced.
///
/// Default button color: #455552 with white text. When selected, change the
/// button color to #177BDD and keep text white. Only one button can be
/// selected at a time.
///
/// Add a full-width "Submit" button at the bottom. Button color: #177BDD with
/// white text. Disable the button until a number is selected.
///
/// Store the selected value in a local state variable called "selectedScore".
///
/// Keep the design clean and minimal.
class NPSsurveyWidget extends StatefulWidget {
  const NPSsurveyWidget({super.key});

  @override
  State<NPSsurveyWidget> createState() => _NPSsurveyWidgetState();
}

class _NPSsurveyWidgetState extends State<NPSsurveyWidget> {
  late NPSsurveyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NPSsurveyModel());

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
        color: Colors.transparent,
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: Color(0xFF57886C),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'How likely are you to recommend this app?',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      color: Color(0xFF4A4D4D),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Not likely',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.dmSans(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: Color(0xFF4A4D4D),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  ),
                  Text(
                    'Very likely',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.dmSans(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: Color(0xFF4A4D4D),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(width: 0.0)),
              ),
              FlutterFlowChoiceChips(
                options: [
                  ChipData('0'),
                  ChipData('1'),
                  ChipData('2'),
                  ChipData('3'),
                  ChipData('4'),
                  ChipData('5'),
                  ChipData('6'),
                  ChipData('7'),
                  ChipData('8'),
                  ChipData('9'),
                  ChipData('10')
                ],
                onChanged: (val) async {
                  safeSetState(
                      () => _model.choiceChipsValue = val?.firstOrNull);
                  logFirebaseEvent('N_P_SSURVEY_ChoiceChips_di36yg6l_ON_FORM');
                  logFirebaseEvent('ChoiceChips_update_component_state');
                  _model.selectedScore = _model.choiceChipsValue;
                  safeSetState(() {});
                },
                selectedChipStyle: ChipStyle(
                  backgroundColor: Color(0xFFAC9A5E),
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).primaryText,
                  iconSize: 18.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: Color(0xFF455552),
                  textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.dmSans(
                          fontWeight:
                              FlutterFlowTheme.of(context).bodySmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodySmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).primaryText,
                  iconSize: 18.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                chipSpacing: 6.0,
                rowSpacing: 8.0,
                multiselect: false,
                alignment: WrapAlignment.start,
                controller: _model.choiceChipsValueController ??=
                    FormFieldController<List<String>>(
                  [],
                ),
                wrapped: true,
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('N_P_SSURVEY_COMP_SUBMIT_BTN_ON_TAP');
                  logFirebaseEvent('Button_backend_call');

                  await NpsResponsesRecord.collection
                      .doc()
                      .set(createNpsResponsesRecordData(
                        score: _model.selectedScore,
                        userId: currentUserUid,
                        timestamp: getCurrentTimestamp,
                      ));
                  logFirebaseEvent('Button_backend_call');
                  unawaited(
                    () async {
                      await currentUserReference!.update(createUsersRecordData(
                        hasAnsweredNps: true,
                      ));
                    }(),
                  );
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(FeedPageWidget.routeName);
                },
                text: 'Submit',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFAC9A5E),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
