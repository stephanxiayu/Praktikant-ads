import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neuetodomitwerbung/ads/ads.dart';
import 'package:neuetodomitwerbung/note/notepage.dart';

import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
    AdmobHelper.initialization();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Notes SQLite';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(create:(BuildContext context)=> AdmobHelper(),
    child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.teal[900],
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          home:  NotesPage()) 
        
  );
}