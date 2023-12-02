import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_location_copy_model.dart';
export 'bottom_location_copy_model.dart';

class BottomLocationCopyWidget extends StatefulWidget {
  const BottomLocationCopyWidget({
    super.key,
    this.name,
    required this.description,
    this.rating,
    this.adr,
    this.cost,
  });

  final String? name;
  final String? description;
  final double? rating;
  final String? adr;
  final int? cost;

  @override
  _BottomLocationCopyWidgetState createState() =>
      _BottomLocationCopyWidgetState();
}

class _BottomLocationCopyWidgetState extends State<BottomLocationCopyWidget> {
  late BottomLocationCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomLocationCopyModel());

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
      alignment: const AlignmentDirectional(0.00, 1.00),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.00, 1.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://picsum.photos/seed/657/600',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 10.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.name,
                                'a',
                              ),
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.cost?.toString(),
                                'd',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 8.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.description,
                            'a',
                          ),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 12.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.rating?.toString(),
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.adr,
                                  'a',
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 8.0, 12.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'l64gm7zn' /* Return */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
