import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'my_routes_model.dart';
export 'my_routes_model.dart';

class MyRoutesWidget extends StatefulWidget {
  const MyRoutesWidget({super.key});

  @override
  _MyRoutesWidgetState createState() => _MyRoutesWidgetState();
}

class _MyRoutesWidgetState extends State<MyRoutesWidget>
    with TickerProviderStateMixin {
  late MyRoutesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyRoutesModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed(
            'Test',
            extra: <String, dynamic>{
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
              ),
            },
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8.0,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 36.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            '08mf8imb' /* Мои Маршруты */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: const Alignment(0.0, 0),
                  child: TabBar(
                    labelColor: FlutterFlowTheme.of(context).turquoise,
                    unselectedLabelColor: FlutterFlowTheme.of(context).grayIcon,
                    labelStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w500,
                            ),
                    unselectedLabelStyle: const TextStyle(),
                    indicatorColor: FlutterFlowTheme.of(context).turquoise,
                    indicatorWeight: 4.0,
                    tabs: [
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          'z7xwmkxy' /* Предстоящие */,
                        ),
                      ),
                      Tab(
                        text: FFLocalizations.of(context).getText(
                          'it9sgdif' /* Завершенные */,
                        ),
                      ),
                    ],
                    controller: _model.tabBarController,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _model.tabBarController,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: StreamBuilder<List<RouteRecord>>(
                            stream: queryRouteRecord(
                              queryBuilder: (routeRecord) => routeRecord
                                  .where(
                                    'usersRef',
                                    arrayContains: currentUserReference,
                                  )
                                  .where(
                                    'finished',
                                    isEqualTo: false,
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
                              List<RouteRecord> listViewRouteRecordList =
                                  snapshot.data!;
                              if (listViewRouteRecordList.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/noTrips@2x.png',
                                    width: 300.0,
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewRouteRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewRouteRecord =
                                      listViewRouteRecordList[listViewIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 12.0),
                                    child: Container(
                                      width: double.infinity,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            listViewRouteRecord.usersRef.first),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final columnUsersRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'Route',
                                                queryParameters: {
                                                  'routeRef': serializeParam(
                                                    listViewRouteRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Stack(
                                                  children: [
                                                    StreamBuilder<
                                                        PropertiesRecord>(
                                                      stream: PropertiesRecord
                                                          .getDocument(
                                                              listViewRouteRecord
                                                                  .properties!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final imagePropertiesRecord =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      imagePropertiesRecord
                                                                          .image
                                                                          .first,
                                                                      'data:image/jpeg;base64,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',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: valueOrDefault<
                                                                      String>(
                                                                    imagePropertiesRecord
                                                                        .image
                                                                        .first,
                                                                    'data:image/jpeg;base64,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' '$listViewIndex',
                                                                  ),
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: valueOrDefault<
                                                                String>(
                                                              imagePropertiesRecord
                                                                  .image.first,
                                                              'data:image/jpeg;base64,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' '$listViewIndex',
                                                            ),
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  imagePropertiesRecord
                                                                      .image
                                                                      .first,
                                                                  'data:image/jpeg;base64,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',
                                                                ),
                                                                width: double
                                                                    .infinity,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        listViewRouteRecord
                                                            .name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          'MMMEd',
                                                          listViewRouteRecord
                                                              .date!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Text(
                                                            columnUsersRecord
                                                                .email,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${listViewRouteRecord.price.toString()} ₸',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: const Color(
                                                                      0xFF95A1AC),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 4.0, 16.0,
                                                          12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ienoru05' /* Итого */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: StreamBuilder<List<RouteRecord>>(
                            stream: queryRouteRecord(
                              queryBuilder: (routeRecord) => routeRecord
                                  .where(
                                    'usersRef',
                                    arrayContains: currentUserReference,
                                  )
                                  .where(
                                    'finished',
                                    isEqualTo: true,
                                  )
                                  .orderBy('Date', descending: true),
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
                              List<RouteRecord> listViewRouteRecordList =
                                  snapshot.data!;
                              if (listViewRouteRecordList.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/noTrips@2x.png',
                                    width: 300.0,
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewRouteRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewRouteRecord =
                                      listViewRouteRecordList[listViewIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 12.0),
                                    child: Container(
                                      width: double.infinity,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            listViewRouteRecord.usersRef.first),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final columnUsersRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'Route',
                                                queryParameters: {
                                                  'routeRef': serializeParam(
                                                    listViewRouteRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Stack(
                                                  children: [
                                                    StreamBuilder<
                                                        PropertiesRecord>(
                                                      stream: PropertiesRecord
                                                          .getDocument(
                                                              listViewRouteRecord
                                                                  .properties!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final imagePropertiesRecord =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        imagePropertiesRecord
                                                                            .image
                                                                            .first,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: imagePropertiesRecord
                                                                      .image
                                                                      .first,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag:
                                                                imagePropertiesRecord
                                                                    .image
                                                                    .first,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    imagePropertiesRecord
                                                                        .image
                                                                        .first,
                                                                width: double
                                                                    .infinity,
                                                                height: 140.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        listViewRouteRecord
                                                            .name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          'MMMEd',
                                                          listViewRouteRecord
                                                              .date!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Text(
                                                            columnUsersRecord
                                                                .email,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${listViewRouteRecord.price.toString()} ₸',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: const Color(
                                                                      0xFF95A1AC),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 4.0, 16.0,
                                                          12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '4hkw9swy' /* Итого */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
