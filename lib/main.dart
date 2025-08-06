import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:quran_app/core/service_locator/service_locator.dart';
import 'package:quran_app/quran_module/presentation/screens/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'SA'), // Set Arabic locale
      supportedLocales: const [
        Locale('ar', 'SA'),
        Locale('en', 'US'), // Arabic and English locales
      ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

