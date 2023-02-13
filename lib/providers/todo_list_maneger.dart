import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/VTislemleri/VTislemleri.dart';
import 'package:login/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoListManeger extends StateNotifier<List<TodoModel>> {
  TodoListManeger([List<TodoModel> initialTodos]) : super(initialTodos ?? []);

  Future<void> adTodo(
      String description, DateTime dateTime, String timeOfDay) async {
    TodoModel eklenecekTodo = TodoModel(
        id: const Uuid().v4(),
        description: description,
        dateTime: dateTime,
        timeOfDay: timeOfDay);
    state = [...state, eklenecekTodo];
    await vtEkle(eklenecekTodo);
  }

  Future<void> ilkYerestir() async {
    List<TodoModel> eklenecekTodo;
    eklenecekTodo = await vTOkuveDondur();
    state = eklenecekTodo;
  }

  Future<void> toggle(String id, int index,TodoModel model) async {
    print(index.toString()+'****------');
     print(model.description.toString()+'****------');
    
    await vtGuncelle(index, model);
    state = [
      for (var deger in state)
        if (deger.id == id)
          TodoModel(
              id: deger.id,
              description: deger.description,
              completed: !deger.completed,
              dateTime: deger.dateTime,
              timeOfDay: deger.timeOfDay)
        else
          deger,
    ];
  }

  void edit({String id, String description}) {
    state = [
      for (var deger in state)
        if (deger.id == id)
          TodoModel(
              id: deger.id,
              description: description,
              completed: deger.completed,
              dateTime: deger.dateTime,
              timeOfDay: deger.timeOfDay)
        else
          deger
    ];
  }

  Future<void> remove(String id, int index) async {
    for (var deger in state) if (deger.id == id) await vtSil(index);
    state = [
      for (var deger in state)
        if (deger.id != id) deger
    ];
  }
}
