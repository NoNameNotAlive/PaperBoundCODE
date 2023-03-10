import '/categories/categories_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Register1Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for passwordLogin widget.
  TextEditingController? passwordLoginController1;
  late bool passwordLoginVisibility1;
  String? Function(BuildContext, String?)? passwordLoginController1Validator;
  // State field(s) for passwordLogin widget.
  TextEditingController? passwordLoginController2;
  late bool passwordLoginVisibility2;
  String? Function(BuildContext, String?)? passwordLoginController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordLoginVisibility1 = false;
    passwordLoginVisibility2 = false;
  }

  void dispose() {
    emailAddressController?.dispose();
    passwordLoginController1?.dispose();
    passwordLoginController2?.dispose();
  }

  /// Additional helper methods are added here.

}
