import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'profile_creation_page_widget.dart' show ProfileCreationPageWidget;
import 'package:flutter/material.dart';

class ProfileCreationPageModel
    extends FlutterFlowModel<ProfileCreationPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataProfilePic = false;
  FFUploadedFile uploadedLocalFile_uploadDataProfilePic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataProfilePic = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for discordNameTextField widget.
  FocusNode? discordNameTextFieldFocusNode;
  TextEditingController? discordNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      discordNameTextFieldTextControllerValidator;
  // State field(s) for twitchTextField widget.
  FocusNode? twitchTextFieldFocusNode;
  TextEditingController? twitchTextFieldTextController;
  String? Function(BuildContext, String?)?
      twitchTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    discordNameTextFieldFocusNode?.dispose();
    discordNameTextFieldTextController?.dispose();

    twitchTextFieldFocusNode?.dispose();
    twitchTextFieldTextController?.dispose();
  }
}
