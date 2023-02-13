import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/models/todo_model.dart';
import 'package:login/providers/all_provider.dart';
import 'package:login/widgets/toolBar/byDateCheckBox.dart';
import 'package:login/widgets/toolBar/filterList.dart';
import 'package:login/widgets/toolBar/gorevSayisi.dart';
import 'package:login/widgetsController.dart/toolbar_widgetController.dart';

class ToolBarWidget extends ConsumerWidget {
  List<DateTime> allTodos;
  ToolBarWidget(this.allTodos, {Key key}) : super(key: key);
  var filter;
  DateTime zaman = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var gorevSayisi = ref.watch(toduCount);
    filter = ref.watch(sayi);

    print("toolbar widgetttt************************************");
    //List<TodoModel> allTodos= ref.watch(todoListProvider);
    return Flexible(
      child: Column(
        children: [
          Flexible(
            child: CalendarAgenda(
              events:
                  allTodos, // [DateTime(2023,01,09,01,01,01),DateTime(2023,01,08,01,01,01)],// list,
              fullCalendarScroll: FullCalendarScroll.vertical,
              backgroundColor: Colors.black,
              initialDate: DateTime.now(),
              firstDate: DateTime(2022),
              lastDate: DateTime(2024),
              selectedDayPosition: SelectedDayPosition.center,
              calendarEventSelectedColor: Colors.white,
              calendarEventColor: Colors.black,
              onDateSelected: (DateTime date) {
                zaman = date;
                ref.read(sayi.notifier).state = [
                  1,
                  date.day,
                  date.month,
                  date.year,
                  true
                ];
              },
            ),
          ),
          Container(
            color: Colors.black,
            child: Column(
              children: [
                GorevSayisi(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ByDateCheckBox(),
                    FilterList(durum: 1, aciklama: 'All'),
                    FilterList(durum: 2, aciklama: 'Active'),
                    FilterList(durum: 3, aciklama: 'Inactive'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
