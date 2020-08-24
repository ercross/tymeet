import './reminder.dart';

enum EventEvents {
  EDIT, SET_REMINDER
}

class Event{
  String    details;
  String    venue;
  DateTime  dateTime;
  Reminder  reminder;

  Event(this.venue, this.dateTime, this.details);

  void setReminder (Reminder reminder){
    this.reminder = reminder;
  }

  void editEvent ([String details, String venue, DateTime dateTime, Reminder reminder]) {
    this.details =  details??this.details;
    this.venue       =  venue??this.venue;
    this.dateTime    =  dateTime??this.dateTime;
    this.reminder    =  reminder??this.reminder;
  }
}