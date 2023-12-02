import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> with TickerProviderStateMixin {
  late TestModel _model;

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
    'textOnPageLoadAnimation6': AnimationInfo(
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
    'textOnPageLoadAnimation7': AnimationInfo(
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
    'textOnPageLoadAnimation8': AnimationInfo(
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
    _model = createModel(context, () => TestModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          title: Text(
            FFLocalizations.of(context).getText(
              '90lmui2h' /* Пройдите тест */,
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 500.0,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '8p26qz5y' /* Где вы планируете отдыхать? */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation1']!),
                              ),
                              Form(
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController1 ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            '1z4i9ipf' /* Алматы */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'mckehslo' /* Актау */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '861v66oj' /*  Астана */,
                                          )
                                        ],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue1 = val),
                                        width: 300.0,
                                        height: 50.0,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'gupyg6do' /* Город */,
                                        ),
                                        searchHintText:
                                            FFLocalizations.of(context).getText(
                                          'sb6mz4b1' /* Найти город.. */,
                                        ),
                                        searchCursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ur439r7u' /* Где вы планируете жить во врем... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation2']!),
                              ),
                              Form(
                                key: _model.formKey3,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController2 ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            'pzwzeki3' /* Квартира */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'a5f5keup' /* Дом */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            't5x09zql' /* Отель */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '37fu5313' /* Хостел */,
                                          )
                                        ],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue2 = val),
                                        width: 300.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'rwkjnv4p' /* Вид жилья */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_model.dropDownValue1 !=
                                  'У меня есть свое жилье')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'g33hlkcv' /* Какой у вас бюджет на жилье? */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation3']!),
                                ),
                              if (_model.dropDownValue1 !=
                                  'У меня есть свое жилье')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 16.0),
                                  child: FlutterFlowDropDown<int>(
                                    controller:
                                        _model.dropDownValueController3 ??=
                                            FormFieldController<int>(null),
                                    options: List<int>.from([
                                      50000,
                                      100000,
                                      200000,
                                      500000,
                                      1000000,
                                      10000000
                                    ]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        '19dh1yah' /* До 50,000 тенге */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'fvere9cl' /* 50-100,000 тенге */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'sk0k6cq8' /* 100-200,000 тенге */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '1qkcukp8' /* 200-500,000 тенге */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'rnvhzywe' /* 500-1,000,000 тенге */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '0oyj1jx2' /* Более 1,000,000 тенге */,
                                      )
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue3 = val),
                                    width: 300.0,
                                    height: 50.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'z7c9w19n' /* Выберите бюджет.. */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'dui0alpl' /* Какой вы хотели бы средний чек... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation4']!),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController4 ??=
                                          FormFieldController<String>(null),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      's2spzho3' /* У меня есть своя еда */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '77jpk11y' /* До 1,000 тенге */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '6xcnuddc' /* 2-5,000 тенге */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'unuswkl0' /* 5-10,000 тенге */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'xssd1auq' /* 10-20,000 тенге */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      's6nm6tqs' /* Более 20,000 тенге */,
                                    )
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue4 = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: FFLocalizations.of(context).getText(
                                    'a4dveex6' /* Выберите бюджет.. */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'drh7fzu5' /* Сколько вы готовы тратить на р... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation5']!),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController5 ??=
                                          FormFieldController<String>(null),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      'djmdvz3c' /* 0 тенге */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'ck6gbjzt' /* До 1,000 тенге */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'reb4kktf' /* 2-5,000 тенге */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'gs9fdnep' /* 5-10,000 тенге */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'w2pbnnjg' /* 10-20,000 тенге */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'jbhi6lvh' /* Более 20,000 тенге */,
                                    )
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue5 = val),
                                  width: 300.0,
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: FFLocalizations.of(context).getText(
                                    'ua0pi83f' /* Выберите бюджет.. */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '6sl656rs' /* Какой вид активностей вам боль... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation6']!),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Form(
                                  key: _model.formKey1,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: FlutterFlowCheckboxGroup(
                                    options: [
                                      FFLocalizations.of(context).getText(
                                        '6v7ovdcm' /* Выставки */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '4tkf3tyg' /* Концерт */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '6q4559o6' /* Стендапы */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'xflu0jig' /* Фестивали */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'om3lfukv' /* Шоу */,
                                      )
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.checkboxGroupValues = val),
                                    controller:
                                        _model.checkboxGroupValueController ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    checkboxBorderColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    checkboxBorderRadius:
                                        BorderRadius.circular(4.0),
                                    initialized:
                                        _model.checkboxGroupValues != null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '0a2fuibl' /* Когда вы планируете отдыхать? */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation7']!),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 24.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: getCurrentTimestamp,
                                      lastDate: DateTime(2050),
                                    );

                                    if (datePickedDate != null) {
                                      safeSetState(() {
                                        _model.datePicked = DateTime(
                                          datePickedDate.year,
                                          datePickedDate.month,
                                          datePickedDate.day,
                                        );
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .lineGray,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 5.0, 12.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                'MMMEd',
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              'Choose Date',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          ),
                                          Icon(
                                            Icons.date_range_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'jx1mkjas' /* Каким будет название для вашег... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation8']!),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 12.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '1lizenva' /* Название маршрута.. */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    alignLabelWithHint: false,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
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
                          count: 6,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: smooth_page_indicator.ExpandingDotsEffect(
                            expansionFactor: 2.0,
                            spacing: 8.0,
                            radius: 16.0,
                            dotWidth: 16.0,
                            dotHeight: 8.0,
                            dotColor: FlutterFlowTheme.of(context).accent1,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.pageViewCurrentIndex == 5) {
                          if ((_model.dropDownValue1 != null &&
                                  _model.dropDownValue1 != '') &&
                              (_model.dropDownValue2 != null &&
                                  _model.dropDownValue2 != '') &&
                              (_model.dropDownValue3 != null) &&
                              (_model.dropDownValue4 != null &&
                                  _model.dropDownValue4 != '') &&
                              (_model.dropDownValue5 != null &&
                                  _model.dropDownValue5 != '') &&
                              (_model.datePicked != null)) {
                            _model.events = await queryEventsRecordOnce(
                              queryBuilder: (eventsRecord) => eventsRecord
                                  .whereIn('Type', _model.checkboxGroupValues),
                            );
                            _model.needsfood =
                                _model.dropDownValue4 == 'У меня есть своя еда'
                                    ? false
                                    : true;
                            _model.home = await queryPropertiesRecordOnce(
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await RouteRecord.collection.doc().set({
                              ...createRouteRecordData(
                                properties: _model.home?.reference,
                                finished: false,
                                date: _model.datePicked,
                                hasOwnHouse: false,
                                name: _model.textController.text,
                                price: valueOrDefault<int>(
                                  _model.home?.price,
                                  100000,
                                ),
                              ),
                              ...mapToFirestore(
                                {
                                  'usersRef': [currentUserReference],
                                  'events': _model.events
                                      ?.take(3)
                                      .toList()
                                      .map((e) => e.reference)
                                      .toList(),
                                },
                              ),
                            });

                            context.goNamed(
                              'myRoutes',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                ),
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Вы не ответили на все вопросы..',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }
                        } else {
                          await _model.pageViewController?.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }

                        setState(() {});
                      },
                      text: _model.pageViewCurrentIndex == 5
                          ? 'Сгенерировать маршрут'
                          : 'Следующий вопрос',
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
