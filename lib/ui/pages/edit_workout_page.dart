
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:scoped_log_me/ui/views/list_workout_exercise_set_view_new.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:scoped_log_me/scoped_models/app_model.dart';
import 'package:scoped_log_me/scoped_models/workout_model.dart';
import 'package:scoped_log_me/ui/pages/select_exercise_page.dart';

class EditWorkoutPage extends StatefulWidget {
  EditWorkoutPage(
      {Key key, this.workoutModel, this.model, this.onCancel, this.onSave})
      : super(key: key);

  final WorkoutModel workoutModel;
  final AppModel model;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  @override
  _EditWorkoutPageState createState() => _EditWorkoutPageState();
}

class _EditWorkoutPageState extends State<EditWorkoutPage> {
  TextEditingController _workoutNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Workout'),
        actions: <Widget>[
          ScopedModel<WorkoutModel>(
            model: widget.workoutModel,
            child: ScopedModelDescendant<WorkoutModel>(builder: (x, y, model) {
              return Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 8),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text('Save'),
                    color: Colors.green,
                    disabledColor: Colors.green,
                    disabledTextColor: Colors.white,
                    textColor: Colors.white,
                    onPressed: () async {
                      HapticFeedback.heavyImpact();
                      await model.saveWorkout();
                     // widget.onSave();
                      Navigator.of(context).pop();
                    }),
              );
            }),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ScopedModel<WorkoutModel>(
              model: widget.workoutModel,
              child:
                  ScopedModelDescendant<WorkoutModel>(builder: (x, y, model) {
                _workoutNameController.text = model.currentWorkout.name;

                return ListTile(
                    title: TextField(
                      decoration:
                          new InputDecoration.collapsed(hintText: ''),
                      controller: _workoutNameController,
                      onChanged: ((value) => model.currentWorkout.name = value),
                      //model.currentWorkout.name
                    ),
                    subtitle: new Text(
                      new DateFormat.MMMd()
                          .format(model.currentWorkout.date)
                          .toString(),
                      style:
                          TextStyle(color: Theme.of(context).iconTheme.color),
                    )

                    // trailing: RaisedButton(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8.0)),
                    //     child: Text('Save'),
                    //     color: Colors.green,
                    //     disabledColor: Colors.green,
                    //     disabledTextColor: Colors.white,
                    //     textColor: Colors.white,
                    //     onPressed: () async{
                    //       HapticFeedback.heavyImpact();
                    //       await model.saveWorkout();
                    //       Navigator.of(context).pop();
                    //     }),
                    );
              })),
          // List of exercises in the current workout
          ScopedModel<WorkoutModel>(
            model: widget.workoutModel,
            child: ListWorkoutExerciseSetNew(),
            //child: ListWorkoutExerciseSet(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ScopedModel<AppModel>(
                  model: AppModel(),
                  child: ScopedModelDescendant<AppModel>(builder: (x, y, m) {
                    return RaisedButton(
                      child: Text('Add Exercises'),
                      shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                      onPressed: () {
                        HapticFeedback.heavyImpact();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectExercisePage(
                                model: widget.model,
                                workoutModel: widget.workoutModel)));
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
