import '/flutter_flow/flutter_flow_util.dart';
import 'my_routes_widget.dart' show MyRoutesWidget;
import 'package:flutter/material.dart';

class MyRoutesModel extends FlutterFlowModel<MyRoutesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
