import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/providers/all_provider.dart';
import 'package:login/services/local_notification_service.dart';

bildirimGonderilsimMi(BuildContext context, WidgetRef ref, DateTime newDateTime,
    TimeOfDay dateTime, String newTodo) {
  showModalBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(MediaQuery.of(context).size.height/40), topLeft: Radius.circular(MediaQuery.of(context).size.height/40))),
      constraints: BoxConstraints(
          //0.464
          maxHeight: MediaQuery.of(context).size.height * 0.51),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.51,
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.height /40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(takvimAcilsinMi.notifier).state = true;
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'lib/images/hayir.png',
                        height: MediaQuery.of(context).size.height / 22,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(takvimAcilsinMi.notifier).state = true;
                        if (DateTime.now().isBefore(DateTime(
                            newDateTime.year,
                            newDateTime.month,
                            newDateTime.day,
                            dateTime.hour,
                            dateTime.minute)))
                          showNotification(newDateTime, dateTime, newTodo);

                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        'lib/images/evet.png',
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Image.asset(
                        'lib/images/notification.png',
                        height: MediaQuery.of(context).size.height / 9,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Text(
                        'Would you like to receive notifications ?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      });
}
