part of 'app.dart';

class Task {
  String title;
  String? description;
  int status = 0;
  DateTime date = DateTime.now();

  Task({required this.title, this.description});

  void updateDescription() {
    print('Enter the new description');
    String? description = stdin.readLineSync()!;
    this.description = description;
    date = DateTime.now();
  }

  void changeStatut() {
    if (status == 1) {
      print('statut on already 1');
    } else {
      status = 1;
      date = DateTime.now();
    }
  }
}
