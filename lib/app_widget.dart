import 'package:flutter/material.dart';

import 'features/homepage/presentations/page/homepage.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 4, 87, 87)),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}
