import '../appointmen_make/appointmen_make_widget.dart';
import '../appointment_details/appointment_details_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MasteAppointmentListWidget extends StatefulWidget {
  MasteAppointmentListWidget({Key key}) : super(key: key);

  @override
  _MasteAppointmentListWidgetState createState() =>
      _MasteAppointmentListWidgetState();
}

class _MasteAppointmentListWidgetState
    extends State<MasteAppointmentListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final masteAppointmentListUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.background,
            automaticallyImplyLeading: false,
            title: Text(
              'Appointments',
              style: FlutterFlowTheme.title1,
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: Image.asset(
                  'assets/images/health-ai_logoHorz.png',
                  width: 120,
                  height: 40,
                  fit: BoxFit.fitWidth,
                ),
              )
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.background,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmenMakeWidget(
                    selectedUserMake: currentUserReference,
                  ),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: Icon(
              Icons.add_rounded,
              color: FlutterFlowTheme.textColor,
              size: 36,
            ),
          ),
          body: SafeArea(
            child: StreamBuilder<List<AppointmentsRecord>>(
              stream: queryAppointmentsRecord(
                queryBuilder: (appointmentsRecord) => appointmentsRecord
                    .orderBy('appointmentTime', descending: true),
              ),
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
                List<AppointmentsRecord> aptListAppointmentsRecordList =
                    snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(aptListAppointmentsRecordList.length,
                      (aptListIndex) {
                    final aptListAppointmentsRecord =
                        aptListAppointmentsRecordList[aptListIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentDetailsWidget(
                                  appointmentDetails:
                                      aptListAppointmentsRecord.reference,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            dateTimeFormat(
                                                'Md',
                                                aptListAppointmentsRecord
                                                    .appointmentTime),
                                            style: FlutterFlowTheme.bodyText1,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              aptListAppointmentsRecord
                                                  .appointmentType,
                                              style: FlutterFlowTheme.subtitle2,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'with',
                                                  style: FlutterFlowTheme
                                                      .bodyText1,
                                                ),
                                                Text(
                                                  aptListAppointmentsRecord
                                                      .appointmentName,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        dateTimeFormat(
                                            'jm',
                                            aptListAppointmentsRecord
                                                .appointmentTime),
                                        style: FlutterFlowTheme.bodyText1,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
