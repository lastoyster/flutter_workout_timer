import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popup_menu/popup_menu.dart';

import 'package:scoped_log_me/models/exerciseSet.dart';
import '../../models/exercise.dart';
import '../../scoped_models/app_model.dart';
import '../../scoped_models/workout_model.dart';
import '../models/workout_model.dart';

class ListWorkoutExerciseSetNew extends StatefulWidget{
  const ListWorkoutExerciseSetNew({
    Key key, this.appModel,
  }): super(key:key);

  final AppModel appModel;

  @override
 _ListWorkoutExerciseSetNewState createState()=> _ListWorkoutExerciseSetNewState();
  }

  class _ListWorkoutExerciseSetNewState extends State<ListWorkoutExerciseSetNew>{
    List <TextEditingController> controller; 
    Map<Exercise, List<TextEditingController>> controllers = new Map<Exercise,List<TextEditingController>();

    UnDrawIllustration illustration;

    @override
  void initState(){
    super.initState();

    WorkoutModel model = ScopedModel.of(context);
    if(model.currentWorkout !=null && model.currentWorkout.exercises == null) {
      setupController();
    }
  
  void setupController(){
    controller =[];
    print(controller.length);
  }
  
  @override
  Widget build(BuildContext context){
  PopupMenu.context = context;
  WorkoutModel model = ScopedModel.of(context);

  if(model.currentWorkout == null){
    return Center(child:CircularProgressIndicator());

    return ScopedModelDescendant<WorkoutModel> (builder:(x,y,mdl){
      return mdl.currentWorkout !=null && mdl.currentWorkout.exercises !=null 
      && mdl.currentWorkout.exercises !=null && mdl.currentWorkout.exercises.length > 0
    
  }
}