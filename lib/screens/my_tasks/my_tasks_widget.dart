import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_task_new/create_task_new_widget.dart';
import '/components/empty_list_tasks/empty_list_tasks_widget.dart';
import '../../_add/extra/animations.dart';
import '../../_add/extra/theme.dart';
import '../../_add/extra/toggle_icon.dart';
import '../../_add/extra/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'my_tasks_model.dart';
export 'my_tasks_model.dart';

class MyTasksWidget extends StatefulWidget {
  const MyTasksWidget({Key? key}) : super(key: key);

  @override
  _MyTasksWidgetState createState() => _MyTasksWidgetState();
}

class _MyTasksWidgetState extends State<MyTasksWidget>
    with TickerProviderStateMixin {
  late MyTasksModel _model;

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
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyTasksModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x230E151B),
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: CreateTaskNewWidget(),
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: FlutterFlowTheme.of(context).info,
        elevation: 8.0,
        child: Icon(
          Icons.add_rounded,
          color: FlutterFlowTheme.of(context).white,
          size: 28.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).info,
        automaticallyImplyLeading: false,
        title: Text(
          'My Tasks',
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Scheduled Tasks',
                    style: FlutterFlowTheme.of(context).titleSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child:
                    PagedListView<DocumentSnapshot<Object?>?, ToDoListRecord>(
                  pagingController: _model.setListViewController(
                    ToDoListRecord.collection
                        .where('user', isEqualTo: currentUserReference)
                        .where('toDoState', isEqualTo: false)
                        .orderBy('toDoDate'),
                  ),
                  padding: EdgeInsets.zero,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<ToDoListRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
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
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) => Center(
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
                    noItemsFoundIndicatorBuilder: (_) => Center(
                      child: EmptyListTasksWidget(),
                    ),
                    itemBuilder: (context, _, listViewIndex) {
                      final listViewToDoListRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'TaskDetails',
                              queryParameters: {
                                'toDoNote': serializeParam(
                                  listViewToDoListRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: Color(0x230E151B),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 0.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listViewToDoListRecord.toDoName,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                dateTimeFormat(
                                                    'MMMEd',
                                                    listViewToDoListRecord
                                                        .toDoDate!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                dateTimeFormat(
                                                    'jm',
                                                    listViewToDoListRecord
                                                        .toDoDate!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          await listViewToDoListRecord.reference
                                              .delete();
                                        },
                                        value: listViewToDoListRecord.toDoState,
                                        onIcon: Icon(
                                          Icons.check_circle,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                              
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
