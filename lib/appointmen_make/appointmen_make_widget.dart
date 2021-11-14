import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/select_user_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmenMakeWidget extends StatefulWidget {
  AppointmenMakeWidget({
    Key key,
    this.selectedUserMake,
  }) : super(key: key);

  final DocumentReference selectedUserMake;

  @override
  _AppointmenMakeWidgetState createState() => _AppointmenMakeWidgetState();
}

class _AppointmenMakeWidgetState extends State<AppointmenMakeWidget>
    with TickerProviderStateMixin {
  DateTime datePicked;
  String appointTypeValue;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'dropDownOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 40,
      fadeIn: true,
      slideOffset: Offset(0, -20),
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, -90),
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 150,
      fadeIn: true,
      slideOffset: Offset(0, -20),
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 150,
      fadeIn: true,
      slideOffset: Offset(0, -20),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.background,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: NavBarPage(initialPage: 'masteAppointmentList'),
              ),
            );
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Make Appointment',
          style: FlutterFlowTheme.title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.background,
      body: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.selectedUserMake),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: SpinKitPumpingHeart(
                      color: Color(0xFFED3599),
                      size: 40,
                    ),
                  ),
                );
              }
              final columnUsersRecord = snapshot.data;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: FlutterFlowDropDown(
                      options: [
                        'Type of Appointment',
                        '1:1 (인도어)',
                        '1:2 (인도어)',
                        '1:1 (아웃도어)'
                      ].toList(),
                      onChanged: (val) =>
                          setState(() => appointTypeValue = val),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.textColor,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.grayLight,
                        size: 15,
                      ),
                      fillColor: FlutterFlowTheme.darkBackground,
                      elevation: 3,
                      borderColor: FlutterFlowTheme.background,
                      borderWidth: 2,
                      borderRadius: 8,
                      margin: EdgeInsetsDirectional.fromSTEB(20, 4, 16, 4),
                      hidesUnderline: true,
                    ).animated([animationsMap['dropDownOnPageLoadAnimation']]),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return SelectUserWidget();
                          },
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.darkBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  widget.selectedUserMake),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: SpinKitPumpingHeart(
                                        color: Color(0xFFED3599),
                                        size: 40,
                                      ),
                                    ),
                                  );
                                }
                                final targetUserUsersRecord = snapshot.data;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.primaryColor,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            targetUserUsersRecord.photoUrl,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                targetUserUsersRecord
                                                    .displayName,
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme
                                                      .textColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            targetUserUsersRecord.email,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (date) {
                            setState(() => datePicked = date);
                          },
                          currentTime: getCurrentTimestamp,
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.darkBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.background,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Text(
                                        'Choose Date',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 4, 0, 0),
                                      child: Text(
                                        dateTimeFormat('MMMMEEEEd', datePicked),
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.tertiaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 46,
                                      icon: Icon(
                                        Icons.date_range_outlined,
                                        color: FlutterFlowTheme.grayLight,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ).animated([animationsMap['containerOnPageLoadAnimation']]),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton1 = true);
                            try {
                              Navigator.pop(context);
                            } finally {
                              setState(() => _loadingButton1 = false);
                            }
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            width: 100,
                            height: 50,
                            color: FlutterFlowTheme.background,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                          loading: _loadingButton1,
                        ).animated(
                            [animationsMap['buttonOnPageLoadAnimation1']]),
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton2 = true);
                            try {
                              final appointmentsCreateData =
                                  createAppointmentsRecordData(
                                appointmentTime: datePicked,
                                appointmentType: appointTypeValue,
                                appointmentPerson: widget.selectedUserMake,
                                appointmentName: columnUsersRecord.displayName,
                              );
                              await AppointmentsRecord.collection
                                  .doc()
                                  .set(appointmentsCreateData);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '\"예약 되었습니다.\"',
                                    style: TextStyle(),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );
                            } finally {
                              setState(() => _loadingButton2 = false);
                            }
                          },
                          text: 'Book Now',
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                          loading: _loadingButton2,
                        ).animated(
                            [animationsMap['buttonOnPageLoadAnimation2']])
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
