import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:login/providers/all_provider.dart';
import 'package:login/services/local_notification_service.dart';
import 'package:login/widgets/takvim/bildirimBottomSheet.dart';
import 'package:login/widgets/takvim/takvimGunAyYil.dart';
import 'package:login/widgets/takvim/takvimSaatDakika.dart';
import 'package:login/widgets/todo/myTextField.dart';
import 'package:login/widgets/todo/todo_list_item_widget.dart';
import 'package:login/widgets/toolBar/toolbar_widget.dart';
import 'package:login/widgetsController.dart/toolbar_widgetController.dart';

import '../../main.dart';

class TodoApp extends ConsumerStatefulWidget {
  const TodoApp({Key key});

  @override
  TodoAppleState createState() => TodoAppleState();
}

class TodoAppleState extends ConsumerState {
  TodoAppleState({Key key});

  @override
  void initState() {
    ref.read(todoListProvider.notifier).ilkYerestir();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var allTodos = ref.watch(filterProvider);
    List<DateTime> list = planlanmisGorevler(allTodos);
    print("todu Appp buildddd--------------------");
    print(allTodos.length.toString());
    return Scaffold(
      backgroundColor: Colors.black,
      body: allTodos.length == 1 && allTodos[0].dateTime.year == 2050
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(child: CircularProgressIndicator(strokeWidth :1)))
          : Column(
              children: [
                ToolBarWidget(list),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.black,
                    child: ListView(
                      children: [
                        MyTextField(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        (allTodos.length == 0 || allTodos.length == null)
                            ? Container(
                                color: Colors.black,
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                                child: const Center(
                                    child: Text(
                                  'No duty in these conditions',
                                  style: TextStyle(color: Colors.blue),
                                )),
                              )
                            : SizedBox(),
                        for (var i = allTodos.length - 1; i >= 0; i--)
                          Dismissible(
                              key: ValueKey(allTodos[i].id),
                              onDismissed: (_) {
                                ref
                                    .read(todoListProvider.notifier)
                                    .remove(allTodos[i].id, i);
                              },
                              child: TodoListItemWidget(
                                item: allTodos[i],
                                index: i,
                              )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
