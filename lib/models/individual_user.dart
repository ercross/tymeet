import 'package:flutter/material.dart';
import 'package:tymeet/exception/exceptions.dart';

import './goal.dart';
import './task.dart';
import './schedule.dart';
import './event.dart';
import './todo.dart';
import './organization.dart';
import 'org_member.dart';


enum IndividualUserEvent {
  FIND_ORGANIZATION, CREATE_ORGANIZATION, VIEW_ORGANIZATION,
  CREATE_ACCOUNT, DELETE_ACCOUNT, GET_DASHBOARD,
  GET_TODOS, GET_SCHEDULES, GET_EVENTS, GET_GOALS, GET_COMPLETED_TASKS, //Todo implement all get methods
  DELETE_TODO, DELETE_GOAL, DELETE_SCHEDULE,
  SETTINGS, CONTACT_DEVELOPER, HELP, ABOUT, 
}

class IndividualUser {
  String name;
  int uniqueID; ///this is the uniqueID that will be used for all other account this user have with other organizations.
  Task currentTask;
  Organization ownOrganization;
  List<Task> completedTasks;
  List<Goal> goals;
  List<Todo> todos;
  List<Event> events;
  List<Schedule> schedules;
  List<Member> accountsWithOrganizations;
  List<OrganizationLabel> organizationsUserBelongTo;

  IndividualUser(this.name) : this.uniqueID = IndividualUser.generateUniqueID(name);

  static int generateUniqueID(String name) {
    int nameToIntTotal = 0;
    name.codeUnits.forEach((element) { nameToIntTotal += element; });
    return DateTime.now().microsecondsSinceEpoch * nameToIntTotal ;
  }

  static void findOrganization (String name) {
    //TODO fetch list of organizations from firebase
  }

  void sendOrganizationAjoinRequest(Organization organization) {
    organization.joinRequests.add(this.uniqueID);
  }

  void createNewOrganization (String name, OrganizationLabel organizationLabel, [String description]) {
    this.ownOrganization = new Organization(name, organizationLabel, description);
  }

  void viewOrganization (OrganizationLabel organizationLabel) {
    if (organizationsUserBelongTo.contains(organizationLabel)) {
      //fetch organization info from database and fix into organization screen
    }
    else throw new NotAnOrganizationMemberException();
  }

  void addNewTodo ({@required String title, String description, @required DateTime dateTime}) {
    todos.add( new Todo(title, dateTime, description));
  }

  void removeTodo (Todo todo) {
    todos.remove(todo);
  }

  void addNewEvent({@required String details, @required String venue, @required DateTime dateTime}){
     events.add(new Event(details, dateTime, venue)) ;
  }

  void removeEvent (Event event) {
    events.remove(event);
  }

  void addNewSchedule(DateTime date) {
    schedules.add(new Schedule(date));
  }

  void addTodoToSchedule(Todo todo) {
    //TODO implement this through the schedule class itself
  }

  void addNewGoal ({@required String title, @required GoalPeriod goalPeriod}) {
    goals.add(new Goal(title, goalPeriod));
  }

  void deleteAccount (){
    //TODO fetch user data from database and delete the murdafurker
  }
}