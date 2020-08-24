import 'package:flutter/material.dart';

import './goal.dart';
import './team.dart';

class Project {
  String title;
  String description;
  List<Goal> goals;
  Duration duration; //TODO implement functionality to output duration in months. Take into account days/month irregularity
  Team team;
  DateTime startDate;
  DateTime expectedEndDate;
  DateTime actualEndDate;
  bool completed;

  Project({this.team,
      @required this.title,
      @required this.description,
      @required this.startDate,
      @required this.expectedEndDate
      }) : completed = false;
}