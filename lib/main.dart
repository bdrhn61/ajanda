import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login/models/todo_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timezone/data/latest_10y.dart';

import 'widgets/todo/todo_app.dart';
//import 'todo_app.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZones();
  ///////////////////////////////////////////////////////////////////////
  await Hive.initFlutter('uygulama');
  Hive.registerAdapter(TodoModelAdapter());
  var boxx = await Hive.openLazyBox<TodoModel>('localVT');
  //await boxx.clear();
  ////////////////////////////////////////////////////////////////////////

  AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true);

  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);

   bool initialized= await  notificationsPlugin.initialize(initializationSettings);

  log("notification $initialized");
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations
            .delegate, // Add global cupertino localiztions.
      ],
      locale: Locale('en', 'US'), // Current locale
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('th', 'TH'), // Thai
      ],
      home: TodoApp(),
    );
  }
}
