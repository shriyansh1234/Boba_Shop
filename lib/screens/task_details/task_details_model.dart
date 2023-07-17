import '../../_add/extra/model.dart';
import '/backend/api_requests/api_calls.dart';

import 'package:flutter/material.dart';


class TaskDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (qoute)] action in Text widget.
  ApiCallResponse? qoute;
  // Stores action output result for [Backend Call - API (qoute)] action in Button widget.
  ApiCallResponse? qoutes;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
