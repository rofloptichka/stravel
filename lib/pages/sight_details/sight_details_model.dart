import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sight_details_widget.dart' show SightDetailsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SightDetailsModel extends FlutterFlowModel<SightDetailsWidget> {
  ///  Local state fields for this page.

  int reload = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (eat)] action in sightDetails widget.
  ApiCallResponse? apiResultPlaces;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
