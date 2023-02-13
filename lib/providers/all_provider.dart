import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:login/models/todo_model.dart';
import 'package:login/providers/todo_list_maneger.dart';
import 'package:login/widgets/todo/todo_list_item_widget.dart';
import 'package:uuid/uuid.dart';



final todoListProvider =
    StateNotifierProvider<TodoListManeger, List<TodoModel>>(
  (ref) {
    return TodoListManeger([
      TodoModel(
        id: '1',
        completed: false,
        description: '',
        dateTime: DateTime(2050,01,01),
        timeOfDay: 'ss',
      )
    ]);
  },
);

final toduCount = Provider<List<int>>((ref) {
  print("watch toducounttttt----");
  var todolist = ref.watch(filterProvider);
  int tamamlanmamis = todolist.where((element) => !element.completed).length;
  int tamamlanmis = todolist.where((element) => element.completed).length;
  int tumGorevSayisi = todolist.length;

  List<int> gorevSayisi = [tumGorevSayisi, tamamlanmis, tamamlanmamis];
  return gorevSayisi;
});

final takvimAcilsinMi = StateProvider<bool>((ref) {
  print("watch toducounttttt----");
  
  return false;
});


final sayi = StateProvider<List<dynamic>>((ref) {
    print("watch sayiiiiiiiii----");
    DateTime temp= DateTime.now();
  return [1, temp.day, temp.month, temp.year, false];
});

// ignore: missing_return
final filterProvider = Provider<List<TodoModel>>((ref) {
  //final filters= ref.watch(toduListFilterProvider);
  final listem = ref.watch(todoListProvider);
  final filtreProvider = ref.watch(sayi);

 // print(filtreProvider[1].toString() + ' ----- zaman zaman');
       print(filtreProvider[0].toString());
       print(filtreProvider[4].toString());
       print(listem.length.toString()+'   ****------*******------****----***---------------------------------');

  if (filtreProvider[4] == false) {
    print("false çalıştı   ---");

    switch (filtreProvider[0]) {
      case 1:
        return listem;
      case 2:
      print('2 çalıştıııı  ....');
      print(listem.where((element) => element.completed).toList().length.toString());
        return listem.where((element) => element.completed).toList();
      case 3:
        return listem.where((element) => !element.completed).toList();
    }
  } else {
    List<TodoModel> temp = [];
    switch (filtreProvider[0]) {
      case 1:
        print('case 1');
        for (TodoModel item in listem) {
          print(item.dateTime.day.toString() +
              '---' +
              filtreProvider[1].toString());
          print(item.dateTime.month.toString() +
              '---' +
              filtreProvider[2].toString());
          print(item.dateTime.year.toString() +
              '---' +
              filtreProvider[3].toString());

          print(tarihUygunMu(item.dateTime, filtreProvider).toString());
          if (tarihUygunMu(item.dateTime, filtreProvider)) {
            temp.add(item);
          }
        }
        print(temp.length);
        return temp;
      case 2:
        for (TodoModel item in listem) {
          if (tarihUygunMu(item.dateTime, filtreProvider) &&
              item.completed == true) {
            temp.add(item);
          }
        }
        return temp;
      case 3:
        for (TodoModel item in listem) {
          if (tarihUygunMu(item.dateTime, filtreProvider) &&
              item.completed == false) {
            temp.add(item);
          }
        }
        return temp;

      //return listem.where((element) => element.dateTime.day==6 ?? element ).toList();
    }
  }
});
bool tarihUygunMu(DateTime tarih, List<dynamic> paramFiltreProvider) {
  if (tarih.day == paramFiltreProvider[1] &&
      tarih.month == paramFiltreProvider[2] &&
      tarih.year == paramFiltreProvider[3])
    return true;
  else
    return false;
}
