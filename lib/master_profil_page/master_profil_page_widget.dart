import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MasterProfilPageWidget extends StatefulWidget {
  MasterProfilPageWidget({
    Key key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference userProfile;

  @override
  _MasterProfilPageWidgetState createState() => _MasterProfilPageWidgetState();
}

class _MasterProfilPageWidgetState extends State<MasterProfilPageWidget> {
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
        final masterProfilPageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.background,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 360,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.darkBackground,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 60, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.primaryColor,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 2, 2, 2),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: valueOrDefault<String>(
                                                masterProfilPageUsersRecord
                                                    .photoUrl,
                                                'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1287&q=80',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 44,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme
                                                    .darkBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: FlutterFlowTheme
                                                      .background,
                                                  width: 2,
                                                ),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                buttonSize: 46,
                                                icon: Icon(
                                                  Icons.edit_outlined,
                                                  color: FlutterFlowTheme
                                                      .grayLight,
                                                  size: 24,
                                                ),
                                                onPressed: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditProfileWidget(
                                                        userProfile:
                                                            masterProfilPageUsersRecord
                                                                .reference,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Container(
                                                width: 44,
                                                height: 44,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme
                                                      .darkBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme
                                                        .background,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  buttonSize: 46,
                                                  icon: Icon(
                                                    Icons.login_rounded,
                                                    color: FlutterFlowTheme
                                                        .secondaryColor,
                                                    size: 24,
                                                  ),
                                                  onPressed: () async {
                                                    await signOut();
                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginPageWidget(),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        masterProfilPageUsersRecord.displayName,
                                        style: FlutterFlowTheme.title3,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: Text(
                                          masterProfilPageUsersRecord.userType,
                                          style: FlutterFlowTheme.subtitle2,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        masterProfilPageUsersRecord.email,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Center',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.bodyText1,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: AutoSizeText(
                                          masterProfilPageUsersRecord
                                              .userCenter,
                                          style: FlutterFlowTheme.title3,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Next Appointment',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              'Aug 20, 2021',
                                              style: FlutterFlowTheme.title1,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.darkBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: Text(
                                        '레슨 설정',
                                        style: FlutterFlowTheme.title3,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.grayLight,
                                    size: 24,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
