import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/bindings/my_bindings.dart';
import 'package:notes_app/core/routing/app_router.dart';
import 'package:notes_app/core/theming/theme.dart';
import 'package:notes_app/ui/screens/notes_screen.dart';
import 'package:notes_app/ui/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyBindings().asyncDependencies();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
      appRouter: AppRouter(),
      welcomeShown: prefs.getBool('welcomeShown') ?? false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter, required this.welcomeShown});

  final AppRouter appRouter;
  final bool welcomeShown;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getAppTheme(),
      getPages: appRouter.generateRoute(),
      home: !welcomeShown ? const NotesScreen() : const WelcomeScreen(),
      initialBinding: MyBindings(),
    );
  }
}
