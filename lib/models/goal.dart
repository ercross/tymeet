enum GoalPeriod {
  DAILY, WEEKLY, MONTHLY, YEARLY
}

class Goal{
  String title;
  GoalPeriod goalPeriod;
  bool done;

  Goal(this.title, this.goalPeriod)
      : done = false;

  void markGoalDone() {
    this.done = true;
  }
}