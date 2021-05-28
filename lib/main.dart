import 'package:flutter/material.dart';
import 'screens/notifications_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NotifationScreen.id,
      routes: {
        NotifationScreen.id: (_) => NotifationScreen(),
      },
    );
  }
}
