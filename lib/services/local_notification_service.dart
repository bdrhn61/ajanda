 import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

 





 
 Future<void> showNotification(
      DateTime date, TimeOfDay hourSec, String yapilacak_gorev) async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        'ajanda-bdrn', 'ajanda',
        priority: Priority.max, importance: Importance.max);

    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notiDetails =
        NotificationDetails(iOS: iosDetails, android: androidDetails);

    DateTime scheduleDate =
        DateTime(date.year, date.month, date.day, hourSec.hour, hourSec.minute);

    await notificationsPlugin.zonedSchedule(0, 'It is time', yapilacak_gorev,
        tz.TZDateTime.from(scheduleDate, tz.local), notiDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime);
  }
