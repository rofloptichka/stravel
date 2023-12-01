import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'amenitity_indicator_model.dart';
export 'amenitity_indicator_model.dart';

class AmenitityIndicatorWidget extends StatefulWidget {
  const AmenitityIndicatorWidget({
    super.key,
    this.icon,
    this.background,
    this.borderColor,
  });

  final Widget? icon;
  final Color? background;
  final Color? borderColor;

  @override
  _AmenitityIndicatorWidgetState createState() =>
      _AmenitityIndicatorWidgetState();
}

class _AmenitityIndicatorWidgetState extends State<AmenitityIndicatorWidget> {
  late AmenitityIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AmenitityIndicatorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.00, 0.00),
      child: Container(
        width: 44.0,
        height: 44.0,
        decoration: BoxDecoration(
          color: widget.background,
          shape: BoxShape.circle,
          border: Border.all(
            color: widget.borderColor!,
            width: 2.0,
          ),
        ),
        alignment: const AlignmentDirectional(0.00, 0.00),
        child: widget.icon!,
      ),
    );
  }
}
