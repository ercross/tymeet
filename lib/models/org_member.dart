import 'dart:collection';

import 'package:tymeet/exception/exceptions.dart';
import 'package:tymeet/models/organization.dart';

import './permission.dart';
import './role.dart';
import './todo.dart';
import 'project.dart';
import 'team.dart';

///@author Ercross

enum MemberEvents {
  ASSIGN_ROLE_TO, ASSIGN_TASK, ASSIGN_PROJECT,
  REQUEST_PERM_APPROVAL, GRANT_PERM_REQUEST,
  ADD_MEMBER, REMOVE_MEMBER, ADD_NEW_ROLES,
  MAKE_SCHEDULE_PUBLIC, EXIT_ORG,
}

class Member {
  final String name;
  final int uniqueID;
  final List<Todo> assignedTasks = List<Todo>();
  final List<OrganizationLabel> labels = List<OrganizationLabel>();
  final List<Permission> permissions = List<Permission>();
  final LinkedHashMap<Member, Permission> permissionRequests = LinkedHashMap<Member, Permission>();
  final List<Role> roles = List<Role>();

  Member(this.uniqueID, this.name, OrganizationLabel organizationLabel) {
    this.labels.add(organizationLabel);
    this.roles.add(PredefinedRoles.MEMBER); ///assigning members a member role further differentiates member accounts from their personal account
  }

  void deleteAccount() {
    //send delete request to database
  }

  void assignNewRoleToMember (Member member, Role role) {
    if (this.permissions.contains(Permission.CAN_ASSIGN_ROLE))
      member.roles.add(role);
    throw new InadequatePermissions();
  }

  void assignNewTaskToMember (Member member, Todo todo) {
    if (this.permissions.contains(Permission.CAN_ASSIGN_TASK))
      member.assignedTasks.add(todo);
    throw new InadequatePermissions();
  }

  void assignProjectToTeam (Team team, Project project) {
    if (this.permissions.contains(Permission.CAN_ASSIGN_PROJECT))
      team.projects.add(project);
    throw new InadequatePermissions();
  }

  void requestPermissionApproval (Member member, Permission permission) {
    if (member.permissions.contains(Permission.CAN_GRANT_PERMS))
      member.permissionRequests.putIfAbsent(this, () => permission);
    throw new InadequatePermissions(member.name + "does not have required permission to grant approval request");
  }

  void addNewMemberToOrganization (Organization organization, int uniqueID, String fullName) {
    if (this.permissions.contains(Permission.CAN_ADD_MEMBER) && organization.members.contains(this)) {
      Member newMember = Member(uniqueID, fullName, organization.organizationLabel);
      organization.members.add(newMember);
    }
    else throw new InadequatePermissions("You do not have the permission to add new members to the organization");
  }

  void removeMemberFromOrganization (Organization organization, Member member) {
    if (this.permissions.contains(Permission.CAN_REMOVE_MEMBER) &&
        organization.members.contains(this)) {
      organization.members.remove(member);
      member.deleteAccount();
    }
    else throw new InadequatePermissions();
  }

  void addNewTeamToOrganization (Organization organization, Team team) {
    if (this.permissions.contains(Permission.CAN_CREATE_TEAM) && organization.members.contains(this))
      organization.teams.add(team);
    throw new InadequatePermissions();
  }

  void dissolveTeam (Organization organization, Team team) {
    if (this.permissions.contains(Permission.CAN_CREATE_TEAM) && organization.members.contains(this))
      organization.teams.remove(team);
    throw new InadequatePermissions();
  }
  
  void addMemberToTeam (Team team, Member member) {
    if (this.labels.contains(team.organizationLabel) && this.permissions.contains(Permission.CAN_EDIT_TEAM)) {
      team.members.add(member);
      //todo persist to database
    }
    throw new InadequatePermissions();
  }

  void removeMemberFromTeam (Team team, Member member) {
    if (this.labels.contains(team.organizationLabel) && this.permissions.contains(Permission.CAN_EDIT_TEAM)) {
      team.members.remove(member);
      //todo persist to database
    }
    throw new InadequatePermissions();
  }

  void create
}