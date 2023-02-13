import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:login/models/todo_model.dart';

Future<void> vtEkle(TodoModel eklencekVeri) async {
  var vt = await Hive.lazyBox<TodoModel>('localVT');
  await vt.add(eklencekVeri);
}

Future<void> vtSil(int index) async {
  print("silinecek index   " +index.toString());
  var vt = await Hive.lazyBox<TodoModel>('localVT');
  await vt.deleteAt(index);
}

Future<void> vtGuncelle(int index,TodoModel guncellenecekVeri) async {
  print("silinecek index   " +index.toString());
  var vt = await Hive.lazyBox<TodoModel>('localVT');
  await vt.putAt(index, TodoModel(
              id: guncellenecekVeri.id,
              description: guncellenecekVeri.description,
              completed: !guncellenecekVeri.completed,
              dateTime: guncellenecekVeri.dateTime,
              timeOfDay: guncellenecekVeri.timeOfDay));
}
Future<List<TodoModel>> vTOkuveDondur() async {
  var vt = await Hive.lazyBox<TodoModel>('localVT');
  List<TodoModel> temp=[];
  for (int i = 0; i < vt.length; i++) {
    TodoModel  deger = await vt.getAt(i);
    temp.add(deger);
    print(deger.description.toString() + '*-*-*-*-*-*-******');
  }
  return temp;
}
