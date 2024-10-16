import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/enums/workout.dart';
import '../../scoped_models/app_model.dart';
import '../../scoped_models/workout_model.dart';
import './scoped_model.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key, this.appModel, this.workoutModel}):super(key: key);

  final WorkoutModel workoutModel;
  final AppModel model;

  @override
  _HomePageState createState()=> _HomePageState();
  }

  class _HomePageState extends State<HomePage>{
    bool unfinishedWorkout = false;
    CalendarController _calendarController;
    List <DateTime> dates;
    Map<DateTime, List<Workout>> _events;
    List<dynamic> _selectedEvents=[];

    @override
  void initState(){
    super.initState();
    print('getting all the exericses');
    widget.workoutModel.getCurrentWorkout();
    widget.model.getAllExercises();
    if(widget.workoutModel.currentWorkout!=null){
      unfinishedWorkout = widget.workout
    print('workout active? '+ this.unfinishedWorkout.toString())
  
  _calendarController = _calendarController();
  _selectedEvents=[];
  }
}