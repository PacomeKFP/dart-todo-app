import 'dart:io';

part 'todo.dart';

class App {
  static List<Task> tasks = [];
  bool isRunning = true;

  void newTask() {
    print('task title :');
    String title = stdin.readLineSync()!;
    print('task Description :');
    String description = stdin.readLineSync()!;
    tasks.add(Task(title: title, description: description));
    return;
  }

  void showTasks() {
    if(tasks.isEmpty){
      print('There is not task added yet, please add a new task');
      return;
    }
    for (Task task in tasks) {
      print(
          '${tasks.indexOf(task)} -) ${task.title} --> ${task.description} =>${task.date} :${task.status == 0 ? 'not done' : 'done'}');
    }
  }

  void removeTask() {

    if (tasks.isEmpty) {
      print('There is no task yet added, please try adding new task');
      return;
    }
    showTasks();
    print('enter the index of the task you want to delete ...');
    int? index = int.tryParse(stdin.readLineSync()!);

    if (index == null) {
      print('task Index have to be not null');
      return;
    }
    tasks.removeAt(index);
    return;
  }

  void setTaskcompleted() {
    if (tasks.isEmpty) {
      print('There is no task yet added, please try adding new task');
      return;
    }
    showTasks();
    print('enter the index of the task you want to set completed ...');
    int? index = int.tryParse(stdin.readLineSync()!);

    if (index == null) {
      print('task Index have to be not null');
      return;
    }
    tasks.elementAt(index).changeStatut();
    return;
  }

  void updateTaskDescription() {
    if (tasks.isEmpty) {
      print('There is no task yet added, please try adding new task');
      return;
    }
    showTasks();
    print('enter the index of the task that you want to modify description...');
    int? index = int.tryParse(stdin.readLineSync()!);

    if (index == null) {
      print('task Index have to be not null');
      return;
    }
    tasks.elementAt(index).updateDescription();
    return;
  }

  router() {
    print('Select operation');
    print('1- show all tasks');
    print('2- add a new task');
    print('3- delete a task');
    print('4- change a task status');
    print('5- change a task Description');
    print('0 - Exit app');
    int? op = int.tryParse(stdin.readLineSync()!);
    while (op == null) {
      print('Select operation');
      op = int.parse(stdin.readLineSync()!);
    }

    switch (op) {
      case 0:
        isRunning = false;
        break;
      case 1:
        showTasks();
        break;
      case 2:
        newTask();
        break;
      case 3:
        removeTask();
        break;
      case 4:
        setTaskcompleted();
        break;
      case 5:
        updateTaskDescription();
        break;
      default:
        router();
        break;
    }
  }
}
