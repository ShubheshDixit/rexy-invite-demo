import 'package:flutter/material.dart';
import 'package:rexy_invite_demo/pages/Auth/invite_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invite Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff14C08D),
        ),
      ),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xff14C08D),
        ),
      ),
      home: const InvitePage(),
    );
  }
}
