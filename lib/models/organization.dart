import 'package:tymeet/models/org_member.dart';

import './user.dart';
import './team.dart';
import './event.dart';
import './project.dart';
import './roadmap.dart';
import './statistics.dart';
import 'individual_user.dart';

class Organization {
  String name;
  String description;
  OrganizationLabel organizationLabel; //unique string to map organization to members
  List<Member> members;
  List<Project> projects;
  Roadmap roadmap;
  List<Team> teams;
  List<Statistics> statistics;
  List<Event> events;
  List<int> joinRequests; ///personal account owners can only send uniqueID

  Organization( this.name, this.organizationLabel, [this.description]);
}


///OrganizationLabel is used to map members to organizations
///A label is a Tymeet unique string to identify an organization
///Therefore, members of the same organization must carry the same OrganizationLabel

class OrganizationLabel {
  final String _label;

  OrganizationLabel(String label): this._label = label;
}