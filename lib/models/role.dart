import './permission.dart';

class Role{
  final String name;
  final Set<Permission> permissions = Set();

  Role(this.name);
}

class PredefinedRoles {
  static final Role ADMIN          =  Role ("Admin");
  static final Role TEAM_LEADER     =  Role ("Team Leader");
  static final Role PROJECT_MANAGER =  Role ("Project Manager");
  static final Role MEMBER         =  Role ("Member");

  static void initAllPermissions() {

  }

  static void initAdminPerms() {
    ADMIN.permissions.add(Permission.CAN_GRANT_PERMS);
    ADMIN.permissions.add(Permission.CAN_ASSIGN_TASK);
    ADMIN.permissions.add(Permission.CAN_ASSIGN_ROLE);
    ADMIN.permissions.add(Permission.CAN_REMOVE_MEMBER);
    ADMIN.permissions.add(Permission.CAN_ADD_MEMBER);
    ADMIN.permissions.add(Permission.CAN_ASSIGN_PROJECT);
    ADMIN.permissions.add(Permission.CAN_CREATE_PROJECT);
    ADMIN.permissions.add(Permission.CAN_DELETE_PROJECT);
    ADMIN.permissions.add(Permission.CAN_EDIT_PROJECT);
    ADMIN.permissions.add(Permission.CAN_EDIT_ROADMAP);
    ADMIN.permissions.add(Permission.CAN_CREATE_ROADMAP);
    ADMIN.permissions.add(Permission.CAN_DELETE_ROADMAP);
    ADMIN.permissions.add(Permission.CAN_EDIT_TEAM);
    ADMIN.permissions.add(Permission.CAN_CREATE_TEAM);
    ADMIN.permissions.add(Permission.CAN_DISSOLVE_TEAM);
    ADMIN.permissions.add(Permission.CAN_REMOVE_EVENT);
    ADMIN.permissions.add(Permission.CAN_EDIT_EVENT);
    ADMIN.permissions.add(Permission.CAN_CREATE_EVENT);
  }

  static void initTeamLeaderPerms() {
    
  }
}