import 'package:vedanya_admin/components/summary_bottom_sheet_widget.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPageWidget extends StatefulWidget {
  const ActivityPageWidget({
    Key key,
    this.statParam,
  }) : super(key: key);

  final String statParam;

  @override
  _ActivityPageWidgetState createState() => _ActivityPageWidgetState();
}

class _ActivityPageWidgetState extends State<ActivityPageWidget> {
  String choiceChipsValue;

  String statisticValue = 'all_time';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetStatisticsCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final activityPageGetStatisticsResponse = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF14181B),
          body: Container(
            color: Color(0xFF14181B),
            child: SafeArea(
              bottom: false,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 52,
                              decoration: BoxDecoration(
                                color: Color(0xFF14181B),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Activity',
                                            style: FlutterFlowTheme.of(context).title1.override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFFDBDBDB),
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 12),
                                  child: Text(
                                    'This Month',
                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF8B97A2),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                child: FlutterFlowChoiceChips(
                                  initiallySelected: [choiceChipsValue],
                                  options: [
                                    ChipData('All time', Icons.timeline),
                                    ChipData('This year', Icons.threesixty),
                                    ChipData('This month', Icons.calendar_view_day),
                                    ChipData('This week', Icons.calendar_view_day_outlined)
                                  ],
                                  onChanged: (val) => setState(() {
                                    choiceChipsValue = val.first;
                                    if (choiceChipsValue == 'All time') statisticValue = 'all_time';
                                    if (choiceChipsValue == 'This year') statisticValue = 'current_year';
                                    if (choiceChipsValue == 'This month') statisticValue = 'current_month';
                                    if (choiceChipsValue == 'This week') statisticValue = 'current_week';
                                  }),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
                                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    iconColor: Colors.white,
                                    iconSize: 18,
                                    elevation: 4,
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF262D34),
                                        ),
                                    iconColor: Color(0xFF262D34),
                                    iconSize: 18,
                                    elevation: 4,
                                  ),
                                  chipSpacing: 20,
                                  multiselect: false,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 4),
                                      child: Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        color: Colors.black,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Chemists \nvisited',
                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                            fontFamily: 'Lexend Deca',
                                                            color: Color(0xFF8B97A2),
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Card(
                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                    color: Color(0x734B39EF),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                      child: Text(
                                                        '^ 38%',
                                                        style: TextStyle(
                                                          color: Color(0xFF4B39EF),
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                                                  child: Text(
                                                    getJsonField(
                                                      (activityPageGetStatisticsResponse?.jsonBody ?? ''),
                                                      '''\$.${statisticValue}.chemists_visited''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(context).title2.override(
                                                          fontFamily: 'Lexend Deca',
                                                          color: Color(0xFF4B39EF),
                                                          fontSize: 22,
                                                          fontWeight: FontWeight.w500,
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
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(2, 4, 4, 4),
                                      child: Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context).alternate,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'ARCs Visited',
                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                            fontFamily: 'Lexend Deca',
                                                            color: Color(0xFFFFD7B6),
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Card(
                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                    color: Color(0x68FFD7B6),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                      child: Text(
                                                        '^ 11%',
                                                        style: TextStyle(
                                                          color: Color(0xFFFFCFCF),
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                                                  child: Text(
                                                    getJsonField(
                                                      (activityPageGetStatisticsResponse?.jsonBody ?? ''),
                                                      '''\$.${statisticValue}.arcs_visited''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(context).title2.override(
                                                          fontFamily: 'Lexend Deca',
                                                          color: Color(0xFFFFD7B6),
                                                          fontSize: 22,
                                                          fontWeight: FontWeight.w500,
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(3, 4, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(2, 4, 4, 4),
                                      child: Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context).primaryColor,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Doctors visited',
                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                            fontFamily: 'Lexend Deca',
                                                            color: Color(0xFFE9F1FF),
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Card(
                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                    color: Color(0x5BB6D0FF),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                      child: Text(
                                                        '^ 86%',
                                                        style: TextStyle(
                                                          color: Color(0xFFE9F1FF),
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                                                  child: Text(
                                                    getJsonField(
                                                      (activityPageGetStatisticsResponse?.jsonBody ?? ''),
                                                      '''\$.${statisticValue}.doctors_visited''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(context).title2.override(
                                                          fontFamily: 'Lexend Deca',
                                                          color: Color(0xFFE9F1FF),
                                                          fontSize: 22,
                                                          fontWeight: FontWeight.w500,
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
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 12),
                                  child: Text(
                                    'Timeline',
                                    style: FlutterFlowTheme.of(context).bodyText2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF8B97A2),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.width * 0.22),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.92,
                                decoration: BoxDecoration(),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: GetSBLRAsPairsCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context).primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewGetSBLRAsPairsResponse = snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final msoPair = (getJsonField(
                                                  (listViewGetSBLRAsPairsResponse?.jsonBody ?? ''),
                                                  r'''$''',
                                                )?.toList() ??
                                                [])
                                            .take(25)
                                            .toList();
                                        return ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          // scrollDirection: Axis.vertical,
                                          itemCount: msoPair.length,
                                          itemBuilder: (context, msoPairIndex) {
                                            final msoPairItem = msoPair[msoPairIndex];
                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.43,
                                                        height: 150,
                                                        decoration: BoxDecoration(
                                                          color: Color(0x00FFFFFF),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.max,
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                                    0, 0, 0, 5),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    Text(
                                                                      'MSO',
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily: 'Poppins',
                                                                            color: Color(0xFFE1E1E1),
                                                                            fontSize: 16,
                                                                            fontWeight: FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '#${getJsonField(
                                                                        msoPairItem,
                                                                        r'''$[0].mso''',
                                                                      ).toString()}',
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily: 'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context)
                                                                                    .secondaryColor,
                                                                            fontSize: 16,
                                                                            fontWeight: FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                        0, 0, 0, 5),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        msoPairItem,
                                                                        r'''$[0].date''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily: 'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context)
                                                                                    .alternate,
                                                                            fontSize: 16,
                                                                            fontWeight: FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                                    0, 0, 0, 5),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    Text(
                                                                      '???',
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily: 'Poppins',
                                                                            color: Colors.white,
                                                                            fontSize: 18,
                                                                            fontWeight: FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        msoPairItem,
                                                                        r'''$[0].total_booking''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily: 'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context)
                                                                                    .primaryColor,
                                                                            fontSize: 16,
                                                                            fontWeight: FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 150,
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xFF000000),
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  border: Border.all(
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                child: ListTile(
                                                                  title: Text(
                                                                    'Summary',
                                                                    textAlign: TextAlign.end,
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .title3
                                                                        .override(
                                                                          fontFamily: 'Poppins',
                                                                          color: Colors.white,
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  trailing: Icon(
                                                                    Icons.arrow_forward_ios,
                                                                    color: Colors.white,
                                                                    size: 15,
                                                                  ),
                                                                  tileColor: Colors.black,
                                                                  dense: false,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(50),
                                                                  ),
                                                                  onTap: () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled: true,
                                                                      backgroundColor: Colors.transparent,
                                                                      context: context,
                                                                      builder: (context) {
                                                                        return Padding(
                                                                          padding: MediaQuery.of(context)
                                                                              .viewInsets,
                                                                          child: Container(
                                                                            height: MediaQuery.of(context)
                                                                                    .size
                                                                                    .height *
                                                                                0.8,
                                                                            child: SummaryBottomSheetWidget(
                                                                              data: getJsonField(
                                                                                msoPairItem,
                                                                                r'''$[0].summary''',
                                                                              ).toString(),
                                                                              date: getJsonField(
                                                                                msoPairItem,
                                                                                r'''$[0].date''',
                                                                              ).toString(),
                                                                              booking: getJsonField(
                                                                                msoPairItem,
                                                                                r'''$[0].total_booking''',
                                                                              ).toString(),
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
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.06,
                                                        decoration: BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              width: 2,
                                                              height: 65,
                                                              decoration: BoxDecoration(
                                                                color: Color(0x3DFFFFFF),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 20,
                                                              height: 20,
                                                              decoration: BoxDecoration(
                                                                color: Color(0x3DFFFFFF),
                                                                borderRadius: BorderRadius.circular(10),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 2,
                                                              height: 65,
                                                              decoration: BoxDecoration(
                                                                color: Color(0x3DFFFFFF),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: getJsonField(
                                                              msoPairItem,
                                                              r'''$[1].date''',
                                                            ) ==
                                                            null
                                                        ? []
                                                        : [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width * 0.06,
                                                              decoration: BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: 2,
                                                                    height: 65,
                                                                    decoration: BoxDecoration(
                                                                      color: Color(0x3DFFFFFF),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    decoration: BoxDecoration(
                                                                      color: Color(0x3DFFFFFF),
                                                                      borderRadius: BorderRadius.circular(10),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 2,
                                                                    height: 65,
                                                                    decoration: BoxDecoration(
                                                                      color: Color(0x3DFFFFFF),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(context).size.width * 0.43,
                                                              height: 150,
                                                              decoration: BoxDecoration(
                                                                color: Color(0x00FFFFFF),
                                                              ),
                                                              child: Container(
                                                                width:
                                                                    MediaQuery.of(context).size.width * 0.43,
                                                                height: 150,
                                                                decoration: BoxDecoration(
                                                                  color: Color(0x00FFFFFF),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                      10, 0, 0, 0),
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsetsDirectional.fromSTEB(
                                                                                0, 0, 0, 5),
                                                                        child: Row(
                                                                          mainAxisSize: MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'MSO',
                                                                              style:
                                                                                  FlutterFlowTheme.of(context)
                                                                                      .bodyText1
                                                                                      .override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color:
                                                                                            Color(0xFFE1E1E1),
                                                                                        fontSize: 16,
                                                                                        fontWeight:
                                                                                            FontWeight.normal,
                                                                                      ),
                                                                            ),
                                                                            Text(
                                                                              '#${getJsonField(
                                                                                msoPairItem,
                                                                                r'''$[1].mso''',
                                                                              ).toString()}',
                                                                              style:
                                                                                  FlutterFlowTheme.of(context)
                                                                                      .bodyText1
                                                                                      .override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme
                                                                                                .of(context)
                                                                                            .secondaryColor,
                                                                                        fontSize: 16,
                                                                                        fontWeight:
                                                                                            FontWeight.w600,
                                                                                      ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional
                                                                                .fromSTEB(0, 0, 0, 5),
                                                                            child: Text(
                                                                              getJsonField(
                                                                                msoPairItem,
                                                                                r'''$[1].date''',
                                                                              ).toString(),
                                                                              style:
                                                                                  FlutterFlowTheme.of(context)
                                                                                      .bodyText1
                                                                                      .override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme
                                                                                                .of(context)
                                                                                            .alternate,
                                                                                        fontSize: 16,
                                                                                        fontWeight:
                                                                                            FontWeight.w600,
                                                                                      ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsetsDirectional.fromSTEB(
                                                                                0, 0, 0, 5),
                                                                        child: Row(
                                                                          mainAxisSize: MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              '???',
                                                                              style:
                                                                                  FlutterFlowTheme.of(context)
                                                                                      .bodyText1
                                                                                      .override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                        fontSize: 18,
                                                                                        fontWeight:
                                                                                            FontWeight.normal,
                                                                                      ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                msoPairItem,
                                                                                r'''$[1].total_booking''',
                                                                              ).toString(),
                                                                              style:
                                                                                  FlutterFlowTheme.of(context)
                                                                                      .bodyText1
                                                                                      .override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme
                                                                                                .of(context)
                                                                                            .primaryColor,
                                                                                        fontSize: 16,
                                                                                        fontWeight:
                                                                                            FontWeight.normal,
                                                                                      ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: 150,
                                                                        decoration: BoxDecoration(
                                                                          color: Color(0xFF000000),
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                          border: Border.all(
                                                                            width: 2,
                                                                          ),
                                                                        ),
                                                                        child: ListTile(
                                                                          title: Text(
                                                                            'Summary',
                                                                            textAlign: TextAlign.end,
                                                                            style:
                                                                                FlutterFlowTheme.of(context)
                                                                                    .title3
                                                                                    .override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Colors.white,
                                                                                      fontSize: 16,
                                                                                      fontWeight:
                                                                                          FontWeight.normal,
                                                                                    ),
                                                                          ),
                                                                          trailing: Icon(
                                                                            Icons.arrow_forward_ios,
                                                                            color: Colors.white,
                                                                            size: 15,
                                                                          ),
                                                                          tileColor: Colors.black,
                                                                          dense: false,
                                                                          contentPadding:
                                                                              EdgeInsetsDirectional.fromSTEB(
                                                                                  0, 0, 20, 0),
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(50),
                                                                          ),
                                                                          onTap: () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor:
                                                                                  Colors.transparent,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding:
                                                                                      MediaQuery.of(context)
                                                                                          .viewInsets,
                                                                                  child: Container(
                                                                                    height:
                                                                                        MediaQuery.of(context)
                                                                                                .size
                                                                                                .height *
                                                                                            0.8,
                                                                                    child:
                                                                                        SummaryBottomSheetWidget(
                                                                                      data: getJsonField(
                                                                                        msoPairItem,
                                                                                        r'''$[1].summary''',
                                                                                      ).toString(),
                                                                                      date: getJsonField(
                                                                                        msoPairItem,
                                                                                        r'''$[1].date''',
                                                                                      ).toString(),
                                                                                      booking: getJsonField(
                                                                                        msoPairItem,
                                                                                        r'''$[1].total_booking''',
                                                                                      ).toString(),
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
                                                            ),
                                                          ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
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
