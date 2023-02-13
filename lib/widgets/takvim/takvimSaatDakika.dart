import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

Future<TimeOfDay> takvimSaatDakika(context) async {
  TimeOfDay  dateTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  await CupertinoRoundedDatePicker.show(
    context,
    fontFamily: "Mali",
    textColor: Colors.white,
    background: Colors.black,
    initialDate: DateTime.now(),
    minimumYear: 2010,
    maximumYear: 2030,
    borderRadius: MediaQuery.of(context).size.height/40,
    initialDatePickerMode: CupertinoDatePickerMode.time,
    onDateTimeChanged: (ss) {
      dateTime = TimeOfDay(hour: ss.hour, minute: ss.minute);
      //print(newDateTime.toString()+'**');
    },
  );
  return dateTime;
}
