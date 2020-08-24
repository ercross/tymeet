import 'package:flutter/material.dart';
import './todo.dart';

/* since a todo will become a task when its DateTime equals current DateTime of the day except if user      * explicitly set a task
 */

//TODO create events/methods to handle duration computation and timeElapsed
class Task {
  Todo todo;
  String title;
  String description;
  bool done;
  DateTime dateTime;
  Duration duration;
  Stopwatch timeElapsed; //a running time to determine duration


  Task(
    { @required this.title, 
      @required this.description, 
      @required this.dateTime
    }
  ) : done = false;

  Task.createFromTodo (this.todo) {
    title = todo.title;
    description = todo.description;
    dateTime = todo.dateTime;
    done = false;
  }
}