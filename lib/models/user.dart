import 'package:flutter/material.dart';
import './schedule.dart';
import './goal.dart';
import './task.dart';
import './role.dart';
import './todo.dart';
import './project.dart';


//TODO is like this file is redundant as it as been replaced by individual_user.dart and org_member.dart
abstract class User {
  Task task; //since task is what user is presently doing, user can only have one task at a time
  List<Todo> todos;
  List<Project> projects;
  List<Goal> goals;
  List<Schedule> schedules;
}

class SingleUser extends User{
  String username;

  SingleUser(this.username);
}

class OrganizationMember extends User{
  String organizationName;
  List<Role> role;
  String firstName;
  String lastName;
  int memberID;

  OrganizationMember ({
    @required this.firstName,
    @required this.lastName,
    @required this.organizationName,
    this.memberID,
    this.role
  }); 
}