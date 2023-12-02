import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/s_o_s_numbers_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'route_model.dart';
export 'route_model.dart';

class RouteWidget extends StatefulWidget {
  const RouteWidget({
    super.key,
    required this.routeRef,
  });

  final DocumentReference? routeRef;

  @override
  _RouteWidgetState createState() => _RouteWidgetState();
}

class _RouteWidgetState extends State<RouteWidget>
    with TickerProviderStateMixin {
  late RouteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 50.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RouteModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(locationPermission);

      context.goNamed(
        'Route',
        queryParameters: {
          'routeRef': serializeParam(
            widget.routeRef,
            ParamType.DocumentReference,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
          ),
        },
      );
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return StreamBuilder<RouteRecord>(
      stream: RouteRecord.getDocument(widget.routeRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final routeRouteRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  context.goNamed(
                    'myRoutes',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'poupr4bd' /* Маршрут */,
                ),
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: PageView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(),
                                  child: StreamBuilder<PropertiesRecord>(
                                    stream: PropertiesRecord.getDocument(
                                        routeRouteRecord.properties!),
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
                                      final columnPropertiesRecord =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Text(
                                                columnPropertiesRecord
                                                    .propertyName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation1']!),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 8.0),
                                              child: Text(
                                                columnPropertiesRecord
                                                    .propertyAddress,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 16.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'propertyDetails',
                                                  queryParameters: {
                                                    'propertyRef':
                                                        serializeParam(
                                                      columnPropertiesRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'propertyRef':
                                                        columnPropertiesRecord,
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'swttl0zp' /* Детали */,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FlutterFlowGoogleMap(
                                              controller:
                                                  _model.googleMapsController1,
                                              onCameraIdle: (latLng) => _model
                                                  .googleMapsCenter1 = latLng,
                                              initialLocation:
                                                  _model.googleMapsCenter1 ??=
                                                      columnPropertiesRecord
                                                          .propertyLocation!,
                                              markerColor:
                                                  GoogleMarkerColor.violet,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 14.0,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: false,
                                              showMapToolbar: false,
                                              showTraffic: false,
                                              centerMapOnMarkerTap: true,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'g6gksweh' /* Покушать */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall,
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<PropertiesRecord>(
                                      stream: PropertiesRecord.getDocument(
                                          routeRouteRecord.properties!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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
                                        final containerPropertiesRecord =
                                            snapshot.data!;
                                        return Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.6,
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: FlutterFlowGoogleMap(
                                              controller:
                                                  _model.googleMapsController2,
                                              onCameraIdle: (latLng) => _model
                                                  .googleMapsCenter2 = latLng,
                                              initialLocation:
                                                  _model.googleMapsCenter2 ??=
                                                      containerPropertiesRecord
                                                          .propertyLocation!,
                                              markers: (functions.listToLatlng(
                                                          EatCall.latt(
                                                            (_model.gde1
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                              ?.cast<double>()
                                                              ?.toList(),
                                                          EatCall.long(
                                                            (_model.gde1
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                              ?.cast<double>()
                                                              ?.toList()) ??
                                                      [])
                                                  .map(
                                                    (marker) =>
                                                        FlutterFlowMarker(
                                                      marker.serialize(),
                                                      marker,
                                                    ),
                                                  )
                                                  .toList(),
                                              markerColor:
                                                  GoogleMarkerColor.violet,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 14.0,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: false,
                                              showMapToolbar: false,
                                              showTraffic: false,
                                              centerMapOnMarkerTap: true,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(),
                                  child: StreamBuilder<EventsRecord>(
                                    stream: EventsRecord.getDocument(
                                        routeRouteRecord.events[0]),
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
                                      final columnEventsRecord = snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Text(
                                                columnEventsRecord.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation2']!),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 16.0),
                                              child: Text(
                                                columnEventsRecord.type,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FlutterFlowGoogleMap(
                                              controller:
                                                  _model.googleMapsController3,
                                              onCameraIdle: (latLng) => _model
                                                  .googleMapsCenter3 = latLng,
                                              initialLocation: _model
                                                      .googleMapsCenter3 ??=
                                                  columnEventsRecord.location!,
                                              markerColor:
                                                  GoogleMarkerColor.violet,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 14.0,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: false,
                                              showMapToolbar: false,
                                              showTraffic: false,
                                              centerMapOnMarkerTap: true,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ojkp7mva' /* Покушать */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall,
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<EventsRecord>(
                                      stream: EventsRecord.getDocument(
                                          routeRouteRecord.events[0]),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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
                                        final containerEventsRecord =
                                            snapshot.data!;
                                        return Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.6,
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: FlutterFlowGoogleMap(
                                              controller:
                                                  _model.googleMapsController4,
                                              onCameraIdle: (latLng) => _model
                                                  .googleMapsCenter4 = latLng,
                                              initialLocation:
                                                  _model.googleMapsCenter4 ??=
                                                      containerEventsRecord
                                                          .location!,
                                              markers: (functions.listToLatlng(
                                                          EatCall.latt(
                                                            (_model.gde
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                              ?.cast<double>()
                                                              ?.toList(),
                                                          EatCall.long(
                                                            (_model.gde
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                              ?.cast<double>()
                                                              ?.toList()) ??
                                                      [])
                                                  .map(
                                                    (marker) =>
                                                        FlutterFlowMarker(
                                                      marker.serialize(),
                                                      marker,
                                                    ),
                                                  )
                                                  .toList(),
                                              markerColor:
                                                  GoogleMarkerColor.violet,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 14.0,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: false,
                                              showMapToolbar: false,
                                              showTraffic: false,
                                              centerMapOnMarkerTap: true,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(),
                                  child: StreamBuilder<EventsRecord>(
                                    stream: EventsRecord.getDocument(
                                        routeRouteRecord.events[
                                            routeRouteRecord.hasOwnHouse
                                                ? 2
                                                : 1]),
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
                                      final columnEventsRecord = snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Text(
                                                columnEventsRecord.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation3']!),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 16.0),
                                              child: Text(
                                                columnEventsRecord.type,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FlutterFlowGoogleMap(
                                              controller:
                                                  _model.googleMapsController5,
                                              onCameraIdle: (latLng) => _model
                                                  .googleMapsCenter5 = latLng,
                                              initialLocation: _model
                                                      .googleMapsCenter5 ??=
                                                  columnEventsRecord.location!,
                                              markerColor:
                                                  GoogleMarkerColor.violet,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 14.0,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: false,
                                              showMapToolbar: false,
                                              showTraffic: false,
                                              centerMapOnMarkerTap: true,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '1m2nmuuz' /* Покушать */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall,
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<EventsRecord>(
                                      stream: EventsRecord.getDocument(
                                          routeRouteRecord.events[1]),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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
                                        final containerEventsRecord =
                                            snapshot.data!;
                                        return Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.6,
                                          decoration: const BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: FlutterFlowGoogleMap(
                                              controller:
                                                  _model.googleMapsController6,
                                              onCameraIdle: (latLng) => _model
                                                  .googleMapsCenter6 = latLng,
                                              initialLocation:
                                                  _model.googleMapsCenter6 ??=
                                                      containerEventsRecord
                                                          .location!,
                                              markers: (functions.listToLatlng(
                                                          EatCall.latt(
                                                            (_model.gde3
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                              ?.cast<double>()
                                                              ?.toList(),
                                                          EatCall.long(
                                                            (_model.gde3
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                              ?.cast<double>()
                                                              ?.toList()) ??
                                                      [])
                                                  .map(
                                                    (marker) =>
                                                        FlutterFlowMarker(
                                                      marker.serialize(),
                                                      marker,
                                                    ),
                                                  )
                                                  .toList(),
                                              markerColor:
                                                  GoogleMarkerColor.violet,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 14.0,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: false,
                                              showMapToolbar: false,
                                              showTraffic: false,
                                              centerMapOnMarkerTap: true,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(),
                                  child: StreamBuilder<EventsRecord>(
                                    stream: EventsRecord.getDocument(
                                        routeRouteRecord.events[
                                            routeRouteRecord.hasOwnHouse
                                                ? 3
                                                : 2]),
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
                                      final columnEventsRecord = snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Text(
                                                columnEventsRecord.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation4']!),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 16.0),
                                              child: Text(
                                                columnEventsRecord.type,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FlutterFlowGoogleMap(
                                              controller:
                                                  _model.googleMapsController7,
                                              onCameraIdle: (latLng) => _model
                                                  .googleMapsCenter7 = latLng,
                                              initialLocation: _model
                                                      .googleMapsCenter7 ??=
                                                  columnEventsRecord.location!,
                                              markerColor:
                                                  GoogleMarkerColor.violet,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 14.0,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: false,
                                              showMapToolbar: false,
                                              showTraffic: false,
                                              centerMapOnMarkerTap: true,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(),
                                  child: StreamBuilder<PropertiesRecord>(
                                    stream: PropertiesRecord.getDocument(
                                        routeRouteRecord.properties!),
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
                                      final columnPropertiesRecord =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Text(
                                                columnPropertiesRecord
                                                    .propertyName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall,
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation5']!),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 8.0),
                                              child: Text(
                                                columnPropertiesRecord
                                                    .propertyAddress,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 16.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'propertyDetails',
                                                  queryParameters: {
                                                    'propertyRef':
                                                        serializeParam(
                                                      columnPropertiesRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'propertyRef':
                                                        columnPropertiesRecord,
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'd34fw77u' /* Детали */,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FlutterFlowGoogleMap(
                                              controller:
                                                  _model.googleMapsController8,
                                              onCameraIdle: (latLng) => _model
                                                  .googleMapsCenter8 = latLng,
                                              initialLocation:
                                                  _model.googleMapsCenter8 ??=
                                                      columnPropertiesRecord
                                                          .propertyLocation!,
                                              markerColor:
                                                  GoogleMarkerColor.violet,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 14.0,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: false,
                                              showMapToolbar: false,
                                              showTraffic: false,
                                              centerMapOnMarkerTap: true,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.00, 1.00),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 16.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(initialPage: 0),
                                count: 8,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!
                                      .animateToPage(
                                    i,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 2.0,
                                  spacing: 8.0,
                                  radius: 16.0,
                                  dotWidth: 16.0,
                                  dotHeight: 8.0,
                                  dotColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).primary,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 32.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.pageViewCurrentIndex == 7) {
                                await routeRouteRecord.reference
                                    .update(createRouteRecordData(
                                  finished: true,
                                ));

                                context.goNamed(
                                  'Properties',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              } else {
                                await _model.pageViewController?.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              }

                              if (_model.pageViewCurrentIndex == 1) {
                                _model.house =
                                    await PropertiesRecord.getDocumentOnce(
                                        routeRouteRecord.properties!);
                                _model.gde1 = await EatCall.call(
                                  location: _model.house?.propertyLocation
                                      ?.toString(),
                                );
                                setState(() {
                                  _model.index = 0;
                                });
                              }
                              if (_model.pageViewCurrentIndex == 3) {
                                _model.event1 =
                                    await EventsRecord.getDocumentOnce(
                                        routeRouteRecord.events.first);
                                _model.gde = await EatCall.call(
                                  location: _model.event1?.location?.toString(),
                                );
                                setState(() {
                                  _model.index = 0;
                                });
                              }
                              if (_model.pageViewCurrentIndex == 5) {
                                _model.event2 =
                                    await EventsRecord.getDocumentOnce(
                                        routeRouteRecord.events.first);
                                _model.gde3 = await EatCall.call(
                                  location: _model.event2?.location?.toString(),
                                );
                                setState(() {
                                  _model.index = 0;
                                });
                              }

                              setState(() {});
                            },
                            text: _model.pageViewCurrentIndex == 3
                                ? 'Окончить маршрут'
                                : 'Следующее место',
                            options: FFButtonOptions(
                              width: 300.0,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 32.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SOSNumbersWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            text: FFLocalizations.of(context).getText(
                              '5w3yd1tx' /* SOS */,
                            ),
                            options: FFButtonOptions(
                              width: 50.0,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
