import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/_iatech/presentation/login/view/login_pg.dart';
import 'package:get_storage/get_storage.dart';
import 'shared/util/preferences.dart';

void main() async {
  await GetStorage.init();

  final prefs = Preferences();
  //await GetStorage.init();
  await prefs.initPrefs();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IA Tech',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    
      getPages: [GetPage(name: '/', page: () => LoginPage())],
    );
  }
}
