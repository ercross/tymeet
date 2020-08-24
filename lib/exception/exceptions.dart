class InadequatePermissions implements Exception {
  String _message = "You do not have the permission to perform this action";

  InadequatePermissions([this._message]);

  @override
  String toString() {
    return _message;
  }
}

class NotAnOrganizationMemberException implements Exception {
  String _message = "Access to this organization dashboard denied: Not a member of the organization";

  NotAnOrganizationMemberException([this._message]);

  @override
  String toString() {
    return _message;
  }
}