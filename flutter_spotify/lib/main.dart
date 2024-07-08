import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/data/data.dart';
import 'package:flutter_spotify/screens/screens.dart';
import 'package:flutter_spotify/widgets/widgets.dart';

void main() async {
  runApp(const MyApp());

  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    print(Platform.operatingSystem);
    doWhenWindowReady(() {
      const initialSize = Size(800, 600);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          scaffoldBackgroundColor: const Color(0xFF121212),
          primaryColor: Colors.black,
          iconTheme: const IconThemeData().copyWith(color: Colors.white),
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            displayMedium: const TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            headlineLarge: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[300],
              fontWeight: FontWeight.w500,
              letterSpacing: 2.0,
            ),
            bodyLarge: TextStyle(
              color: Colors.grey[300],
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
            bodyMedium: TextStyle(
              color: Colors.grey[300],
              letterSpacing: 1.0,
            ),
          )),
      home: const Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Row(
              children: [
                SideMenu(),
                PlaylistScreen(
                  playlist: lofihiphopPlaylist,
                ),
              ],
            ),
          ),
          Container(
            height: 80.0,
            width: double.infinity,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
