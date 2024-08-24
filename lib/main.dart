import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lyrica/Colors/colors.dart';
import 'package:lyrica/Screens/splashscreen.dart';
import 'package:lyrica/database/db_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter(MusicModelAdapter());
  // if (!Hive.isAdapterRegistered(MusicModelAdapter().typeId)) {
  //   Hive.registerAdapter(MusicModelAdapter());
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: ColorManger.Scaffoldcolor),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
