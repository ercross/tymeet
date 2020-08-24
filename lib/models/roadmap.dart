import 'package:flutter/material.dart';
import './goal.dart';
import './project.dart';

class Roadmap{
  DateTime startDate;
  DateTime endDate;
  List<Goal> goals;
  List<Project> projects;

  Roadmap({@required this.startDate,
      @required this.endDate,
  });
}