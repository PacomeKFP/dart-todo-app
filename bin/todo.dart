import 'package:todo/app.dart';
void main(List<String> arguments) {
  App app = App();
  while (app.isRunning ){
     app.router();
  }
  
}
