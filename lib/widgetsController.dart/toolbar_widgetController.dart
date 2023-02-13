import 'package:login/models/todo_model.dart';

List<DateTime> planlanmisGorevler(List<TodoModel> allTodos) {
  print(allTodos.length.toString()+'-------------------------------------------');
  List<DateTime> temp = [];
  allTodos.forEach((element) {
   // print(element.dateTime.toString() +'-------------------------------------------');
    temp.add(element.dateTime);
  });
  
  return temp;
}
