enum TodoEvent{
  CREATE, EDIT, MARK_DONE, 
}


class Todo {
  String title;
  String description;
  bool done;
  DateTime dateTime;

  Todo (this.title, this.dateTime, [this.description]) : this.done = false;

  void editTodo ({String title, String description, String dateTime}) {
    this.title = title??this.title;
    this.description = description??this.description;
    this.dateTime = dateTime??this.dateTime;
  }

  void markDone () {
    this.done = true;
  }
  

}