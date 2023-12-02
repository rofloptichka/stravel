import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'tours_model.dart';
export 'tours_model.dart';

class ToursWidget extends StatefulWidget {
  const ToursWidget({super.key});

  @override
  _ToursWidgetState createState() => _ToursWidgetState();
}

class _ToursWidgetState extends State<ToursWidget> {
  late ToursModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToursModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '7x3u2772' /* Найти туров и гидов */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          const Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'j529zhu7' /* Найти туры.. */,
                          ),
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        icon: Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await queryGuidesRecordOnce()
                              .then(
                                (records) => _model.simpleSearchResults =
                                    TextSearch(
                                  records
                                      .map(
                                        (record) => TextSearchItem.fromTerms(
                                            record, [record.displayName]),
                                      )
                                      .toList(),
                                )
                                        .search(_model.textController.text)
                                        .map((r) => r.object)
                                        .toList(),
                              )
                              .onError(
                                  (_, __) => _model.simpleSearchResults = [])
                              .whenComplete(() => setState(() {}));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'b6su1taq' /* Туры */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Container(
                width: double.infinity,
                height: 170.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: StreamBuilder<List<ToursRecord>>(
                  stream: queryToursRecord(
                    queryBuilder: (toursRecord) => toursRecord.where(
                      'isOrg',
                      isEqualTo: true,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ToursRecord> listViewToursRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listViewToursRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewToursRecord =
                            listViewToursRecordList[listViewIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 12.0, 12.0),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                listViewToursRecord.userRef!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final containerUsersRecord = snapshot.data!;
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'chatDetails',
                                    queryParameters: {
                                      'chatUser': serializeParam(
                                        containerUsersRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatUser': containerUsersRecord,
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: 160.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x34090F13),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              listViewToursRecord
                                                  .displayPhoto.first,
                                              'data:image/png;base64,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',
                                            ),
                                            width: 60.0,
                                            height: 60.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              listViewToursRecord.displayName,
                                              'Kosai',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'jzaetgmf' /* Гиды */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 44.0),
                child: StreamBuilder<List<GuidesRecord>>(
                  stream: queryGuidesRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<GuidesRecord> listViewGuidesRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewGuidesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewGuidesRecord =
                            listViewGuidesRecordList[listViewIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x32000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(26.0),
                                    child: Image.network(
                                      listViewGuidesRecord.photoUrl,
                                      width: 36.0,
                                      height: 36.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listViewGuidesRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        listViewGuidesRecord.userRef!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final buttonUsersRecord = snapshot.data!;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'chatDetails',
                                            queryParameters: {
                                              'chatUser': serializeParam(
                                                buttonUsersRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chatUser': buttonUsersRecord,
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'yuyrupjw' /* Chat */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 70.0,
                                          height: 36.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
