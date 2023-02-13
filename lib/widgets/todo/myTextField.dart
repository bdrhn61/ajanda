import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart';
import 'package:login/providers/all_provider.dart';
import 'package:login/widgets/takvim/bildirimBottomSheet.dart';
import 'package:login/widgets/takvim/takvimGunAyYil.dart';
import 'package:login/widgets/takvim/takvimSaatDakika.dart';

class MyTextField extends ConsumerWidget {
  MyTextField({Key key}) : super(key: key);
  TimeOfDay dateTime;
  DateTime newDateTime;
  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.width / 6.4,
        child: Stack(
          children: [
         
            TextField(
              controller: newTodoController,
              style: TextStyle(color: Colors.blue),
              decoration: const InputDecoration(
                 enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.blue),   
                      ),  
                  hintText: 'What will you do today ?',
                  hintStyle: TextStyle(color: Colors.blue)),
              onSubmitted: (newTodo) async {
                if(newTodo.trim().length>0){
                newTodoController.clear();
                ref.read(takvimAcilsinMi.notifier).state = false;
                newDateTime = DateTime.now();
                newDateTime = await takvimGunAyYil(context);

                dateTime = TimeOfDay.now();

                if (newDateTime != null &&
                    ref.read(takvimAcilsinMi.notifier).state) {
                  ref.read(takvimAcilsinMi.notifier).state = false;
                  dateTime = await takvimSaatDakika(context);
                }
                if (newDateTime != null &&
                    ref.read(takvimAcilsinMi.notifier).state) {
                  bildirimGonderilsimMi(
                      context, ref, newDateTime, dateTime, newTodo);
                }
                print(ref.read(takvimAcilsinMi.notifier).state.toString() +
                    '*************');
                if (newTodo != null &&
                    newDateTime != null &&
                    dateTime != null &&
                    ref.read(takvimAcilsinMi.notifier).state) {
                  print("eklendiiiiiiii -----------------------");
                  ref
                      .read(todoListProvider.notifier)
                      .adTodo(newTodo, newDateTime, dateTime.toString());
                  ref.read(takvimAcilsinMi.notifier).state = false;
                } else
                  print('.--------------------');
                }
              },
            )
          ],
        ));
  }
}
