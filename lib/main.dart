import 'package:flutter/material.dart';
import 'package:note_app/core/services/theme_services.dart';
import 'package:note_app/core/theme.dart';
import 'package:note_app/features/user/view/add_note_view.dart';
import 'package:note_app/features/user/view/homepage.dart';
import 'package:note_app/features/user/viewmodels/note_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>ThemeServiceProvider()),
        ChangeNotifierProvider(create: (context)=>NoteViewModel()),
      ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(builder: (context,themeprovider,child){
      return MaterialApp(
        initialRoute: '/',
        routes: {
          '/':(context)=>HomePage(),
          '/newnote':(context)=>AddNotes(),
        },
        title: 'NotePad',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeprovider.isDarkModeOn? ThemeMode.dark:ThemeMode.light,

        debugShowCheckedModeBanner: false,
      );
    });
  }
}