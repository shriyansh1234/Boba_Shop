import '/components/create_task_new/create_task_new_widget.dart';
import '../../_add/extra/theme.dart';
import '../../_add/extra/util.dart';
import '../../_add/extra/widgets.dart';
import 'package:flutter/material.dart';
import 'empty_list_tasks_model.dart';
export 'empty_list_tasks_model.dart';

class EmptyListTasksWidget extends StatefulWidget {
  const EmptyListTasksWidget({Key? key}) : super(key: key);

  @override
  _EmptyListTasksWidgetState createState() => _EmptyListTasksWidgetState();
}

class _EmptyListTasksWidgetState extends State<EmptyListTasksWidget> {
  late EmptyListTasksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListTasksModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/uiList_Empty@3x.png',
          width: 230.0,
          height: 150.0,
          fit: BoxFit.fitHeight,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You don\'t have any tasks',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Create tasks by tapping the button below.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleSmall,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: FFButtonWidget(
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
                      height: double.infinity,
                      child: CreateTaskNewWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            text: 'Create Task',
            options: FFButtonOptions(
              width: 170.0,
              height: 50.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).info,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
      ],
    );
  }
}
