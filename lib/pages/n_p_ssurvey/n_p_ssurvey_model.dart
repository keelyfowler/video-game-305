import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'n_p_ssurvey_widget.dart' show NPSsurveyWidget;
import 'package:flutter/material.dart';

class NPSsurveyModel extends FlutterFlowModel<NPSsurveyWidget> {
  ///  Local state fields for this component.

  String? selectedScore;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
