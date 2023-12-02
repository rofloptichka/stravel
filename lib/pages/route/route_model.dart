import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'route_widget.dart' show RouteWidget;
import 'package:flutter/material.dart';

class RouteModel extends FlutterFlowModel<RouteWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter3;
  final googleMapsController3 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter4;
  final googleMapsController4 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter5;
  final googleMapsController5 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter6;
  final googleMapsController6 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter7;
  final googleMapsController7 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter8;
  final googleMapsController8 = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  PropertiesRecord? house;
  // Stores action output result for [Backend Call - API (eat)] action in Button widget.
  ApiCallResponse? gde1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  EventsRecord? event1;
  // Stores action output result for [Backend Call - API (eat)] action in Button widget.
  ApiCallResponse? gde;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  EventsRecord? event2;
  // Stores action output result for [Backend Call - API (eat)] action in Button widget.
  ApiCallResponse? gde3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
