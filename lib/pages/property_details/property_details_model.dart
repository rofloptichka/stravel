import '/components/amenitity_indicator/amenitity_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'property_details_widget.dart' show PropertyDetailsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PropertyDetailsModel extends FlutterFlowModel<PropertyDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for amenitityIndicator component.
  late AmenitityIndicatorModel amenitityIndicatorModel1;
  // Model for amenitityIndicator component.
  late AmenitityIndicatorModel amenitityIndicatorModel2;
  // Model for amenitityIndicator component.
  late AmenitityIndicatorModel amenitityIndicatorModel3;
  // Model for amenitityIndicator component.
  late AmenitityIndicatorModel amenitityIndicatorModel4;
  // Model for amenitityIndicator component.
  late AmenitityIndicatorModel amenitityIndicatorModel5;
  // Model for amenitityIndicator component.
  late AmenitityIndicatorModel amenitityIndicatorModel6;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    amenitityIndicatorModel1 =
        createModel(context, () => AmenitityIndicatorModel());
    amenitityIndicatorModel2 =
        createModel(context, () => AmenitityIndicatorModel());
    amenitityIndicatorModel3 =
        createModel(context, () => AmenitityIndicatorModel());
    amenitityIndicatorModel4 =
        createModel(context, () => AmenitityIndicatorModel());
    amenitityIndicatorModel5 =
        createModel(context, () => AmenitityIndicatorModel());
    amenitityIndicatorModel6 =
        createModel(context, () => AmenitityIndicatorModel());
  }

  @override
  void dispose() {
    amenitityIndicatorModel1.dispose();
    amenitityIndicatorModel2.dispose();
    amenitityIndicatorModel3.dispose();
    amenitityIndicatorModel4.dispose();
    amenitityIndicatorModel5.dispose();
    amenitityIndicatorModel6.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
