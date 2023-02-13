import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/models/todo_model.dart';
import 'package:login/providers/all_provider.dart';
import 'package:login/widgets/todo/ayGetir.dart';

class TodoListItemWidget extends ConsumerWidget {
  TodoModel item;
  int index;
  TodoListItemWidget({Key key, this.item, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('List item build');
    var state = ref.watch(todoListProvider.notifier);

    return item.dateTime.year == 2050
        ? SizedBox()
        : ListTile(
            trailing: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white,
              ),
              child: Checkbox(
                activeColor: Colors.blue,
                checkColor: Colors.white,
                value: item.completed,
                onChanged: (value) {
                  state.toggle(item.id, index, item);

                  debugPrint(value.toString());
                },
              ),
            ),
            title: Text(
              item.description,
              style: TextStyle(color: Colors.blue),
            ),
            subtitle: Container(
              color: Colors.black,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                    item.dateTime.day.toString() +
                        ' / ' +
                        ayGetir(item.dateTime.month) +
                        ' / ' +
                        item.dateTime.year.toString(),
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
          );
  }

 
}
