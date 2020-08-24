import 'package:tymeet/models/org_member.dart';
import 'package:tymeet/models/organization.dart';

import './user.dart';
import './event.dart';
import './goal.dart';
import 'project.dart';

class Team{
  String name;
  List<Goal> goals;
  List<Member> members;
  List<Event> events;
  List<Project> projects;
  OrganizationLabel organizationLabel;

  Team(this.name);
}