import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'book_now_model.dart';
export 'book_now_model.dart';

class BookNowWidget extends StatefulWidget {
  const BookNowWidget({
    super.key,
    this.propertyDetails,
  });

  final PropertiesRecord? propertyDetails;

  @override
  _BookNowWidgetState createState() => _BookNowWidgetState();
}

class _BookNowWidgetState extends State<BookNowWidget>
    with TickerProviderStateMixin {
  late BookNowModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
          begin: const Offset(0.0, 72.0),
          end: const Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookNowModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            'tjxehwww' /* Бронировать сейчас */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).cultured,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Builder(
            builder: (context) {
              final image = widget.propertyDetails?.image
                      .map((e) => e)
                      .toList()
                      .toList() ??
                  [];
              return SizedBox(
                width: double.infinity,
                height: 180.0,
                child: CarouselSlider.builder(
                  itemCount: image.length,
                  itemBuilder: (context, imageIndex, _) {
                    final imageItem = image[imageIndex];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageItem,
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  carouselController: _model.carouselController ??=
                      CarouselController(),
                  options: CarouselOptions(
                    initialPage: min(1, image.length - 1),
                    viewportFraction: 0.5,
                    disableCenter: true,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.25,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: false,
                    onPageChanged: (index, _) =>
                        _model.carouselCurrentIndex = index,
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: const AlignmentDirectional(-1.00, 0.00),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
              child: Text(
                widget.propertyDetails!.propertyName.maybeHandleOverflow(
                  maxChars: 70,
                  replacement: '…',
                ),
                style: FlutterFlowTheme.of(context).displaySmall,
              ),
            ),
          ),
          Divider(
            height: 2.0,
            thickness: 1.0,
            indent: 12.0,
            endIndent: 12.0,
            color: FlutterFlowTheme.of(context).lineGray,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'tu9txb3i' /* Выберите даты поездки */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final datePicked1Date = await showDatePicker(
                        context: context,
                        initialDate: getCurrentTimestamp,
                        firstDate: getCurrentTimestamp,
                        lastDate: DateTime(2050),
                      );

                      if (datePicked1Date != null) {
                        safeSetState(() {
                          _model.datePicked1 = DateTime(
                            datePicked1Date.year,
                            datePicked1Date.month,
                            datePicked1Date.day,
                          );
                        });
                      }
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.44,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineGray,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 5.0, 12.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  'MMMEd',
                                  _model.datePicked1,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                'Choose Date',
                              ),
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                            Icon(
                              Icons.date_range_outlined,
                              color: FlutterFlowTheme.of(context).grayIcon,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final datePicked2Date = await showDatePicker(
                      context: context,
                      initialDate: (_model.datePicked1 ?? DateTime.now()),
                      firstDate: (_model.datePicked1 ?? DateTime.now()),
                      lastDate: DateTime(2050),
                    );

                    if (datePicked2Date != null) {
                      safeSetState(() {
                        _model.datePicked2 = DateTime(
                          datePicked2Date.year,
                          datePicked2Date.month,
                          datePicked2Date.day,
                        );
                      });
                    }
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.44,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).lineGray,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              dateTimeFormat(
                                'MMMEd',
                                _model.datePicked2,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              'Choose Date',
                            ),
                            style: FlutterFlowTheme.of(context).titleSmall,
                          ),
                          Icon(
                            Icons.date_range_outlined,
                            color: FlutterFlowTheme.of(context).grayIcon,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    '45xiza15' /* Количество людей */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(40.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).lineGray,
                  width: 1.0,
                ),
              ),
              child: FlutterFlowCountController(
                decrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.minus,
                  color: enabled
                      ? FlutterFlowTheme.of(context).grayIcon
                      : FlutterFlowTheme.of(context).grayIcon,
                  size: 20.0,
                ),
                incrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.plus,
                  color: enabled
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).grayIcon,
                  size: 20.0,
                ),
                countBuilder: (count) => Text(
                  count.toString(),
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
                count: _model.countControllerValue ??= 1,
                updateCount: (count) =>
                    setState(() => _model.countControllerValue = count),
                stepSize: 1,
                minimum: 1,
                maximum: 8,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'ru1nnosa' /* Данные оплаты */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: FlutterFlowCreditCardForm(
              formKey: _model.creditCardFormKey,
              creditCardModel: _model.creditCardInfo,
              obscureNumber: true,
              obscureCvv: false,
              spacing: 10.0,
              textStyle: FlutterFlowTheme.of(context).titleSmall,
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).lineGray,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).lineGray,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'q5ru22ip' /* Итого */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: const Color(0xFF8B97A2),
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 36.0,
                          icon: Icon(
                            Icons.info_outlined,
                            color: FlutterFlowTheme.of(context).grayIcon,
                            size: 18.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                    Text(
                      '${functions.newCustomFunction(widget.propertyDetails!.price, _model.countControllerValue!).toString()} ₸',
                      style: FlutterFlowTheme.of(context).displaySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.propertyDetails!.owner!),
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
              final bottomButtonAreaUsersRecord = snapshot.data!;
              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF4B39EF),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7.0,
                      color: Color(0x55000000),
                      offset: Offset(0.0, -1.0),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 34.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var tripsRecordReference = TripsRecord.collection.doc();
                      await tripsRecordReference.set(createTripsRecordData(
                        propertyRef: widget.propertyDetails?.reference,
                        userRef: currentUserReference,
                        tripBeginDate: _model.datePicked1,
                        tripEndDate: _model.datePicked2,
                        paymentMethod: 'MasterCard **33',
                        tripCreated: getCurrentTimestamp,
                        host: bottomButtonAreaUsersRecord.reference,
                        guests: _model.countControllerValue,
                        tripTotal: functions.newCustomFunction(
                            widget.propertyDetails!.price,
                            _model.countControllerValue!),
                        cancelTrip: false,
                        upcoming: true,
                      ));
                      _model.newTrip = TripsRecord.getDocumentFromData(
                          createTripsRecordData(
                            propertyRef: widget.propertyDetails?.reference,
                            userRef: currentUserReference,
                            tripBeginDate: _model.datePicked1,
                            tripEndDate: _model.datePicked2,
                            paymentMethod: 'MasterCard **33',
                            tripCreated: getCurrentTimestamp,
                            host: bottomButtonAreaUsersRecord.reference,
                            guests: _model.countControllerValue,
                            tripTotal: functions.newCustomFunction(
                                widget.propertyDetails!.price,
                                _model.countControllerValue!),
                            cancelTrip: false,
                            upcoming: true,
                          ),
                          tripsRecordReference);

                      context.goNamed(
                        'tripDetails',
                        queryParameters: {
                          'propertyRef': serializeParam(
                            widget.propertyDetails,
                            ParamType.Document,
                          ),
                          'tripRef': serializeParam(
                            _model.newTrip,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'propertyRef': widget.propertyDetails,
                          'tripRef': _model.newTrip,
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Ваша книга успешно забронирована!',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).turquoise,
                        ),
                      );

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'rlgv6kse' /* Бронировать сейчас */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 60.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF4B39EF),
                      textStyle:
                          FlutterFlowTheme.of(context).displaySmall.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!);
            },
          ),
        ],
      ),
    );
  }
}
