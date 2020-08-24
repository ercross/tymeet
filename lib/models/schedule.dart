import './todo.dart';

class Schedule {
    DateTime date; 
    List<Todo> todos;

    Schedule(this.date);

    void addNewTodo(Todo todo) {
      if (todo.dateTime.year != date.year && todo.dateTime.month != date.month && todo.dateTime.day != date.day) {
        todo.dateTime = date;
      }
      todos.add(todo);
    }
}