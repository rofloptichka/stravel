import '/components/amenitity_indicator/amenitity_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_property_widget.dart' show EditPropertyWidget;
import 'package:flutter/material.dart';

class EditPropertyModel extends FlutterFlowModel<EditPropertyWidget> {
  ///  Local state fields for this page.

  bool pool = false;

  bool ac = false;

  bool laundry = false;

  bool gym = false;

  bool bar = false;

  bool events = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
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
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

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
