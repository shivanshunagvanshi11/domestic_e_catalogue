import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domestic_e_catalogue/services/hive_service.dart';
import 'package:domestic_e_catalogue/presentation/providers/catalog_provider.dart';
import 'package:domestic_e_catalogue/presentation/screens/splash/splash_screen.dart';
import 'package:domestic_e_catalogue/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final hiveService = HiveService();
  await hiveService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CatalogProvider(hiveService)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JK Fenner E-Catalogue',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
