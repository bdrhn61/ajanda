import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

 Future<DateTime> takvimGunAyYil(BuildContext context) async {
  DateTime newDateTime = DateTime.now();
  await CupertinoRoundedDatePicker.show(
    context,
    fontFamily: "Mali",
    textColor: Colors.white,
    background: Colors.black,
    initialDate: DateTime.now(),
    minimumYear: 2010,
    maximumYear: 2030,
    borderRadius: MediaQuery.of(context).size.height/40,
    initialDatePickerMode: CupertinoDatePickerMode.date,
    onDateTimeChanged: (ss) {
      newDateTime = ss;
      // print(newDateTime.toString()+'**');
       
    },
  );

  return newDateTime;
}
