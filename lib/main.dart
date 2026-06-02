import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:smart_meal_ta/features/budget/providers/budget_providers.dart';
import 'package:smart_meal_ta/features/ai_recommendation/providers/recommendation_providers.dart';

// Import Services
import 'package:smart_meal_ta/core/services/database_service.dart';
import 'package:smart_meal_ta/core/services/notification_service.dart';
// Import Providers
import 'package:smart_meal_ta/features/auth/providers/login_providers.dart';

// Import Screens
import 'package:smart_meal_ta/features/auth/screens/login_page.dart';
import 'package:smart_meal_ta/features/home/screens/home_page.dart';
import 'package:smart_meal_ta/features/profile/screens/account_setting_page.dart';
import 'package:smart_meal_ta/features/auth/screens/register_page.dart';
import 'package:smart_meal_ta/features/profile/screens/feedback_page.dart';
import 'package:smart_meal_ta/features/auth/screens/splash_page.dart';
import 'package:smart_meal_ta/features/ai_nutrition/screens/ai_nutrition_screen.dart';
import 'package:smart_meal_ta/features/ai_nutrition/providers/ai_nutrition_provider.dart';

Future<void> main() async {
  // 1. WAJIB: Pastikan binding mesin Flutter sudah siap sebelum akses plugin (Native)
  // Ini adalah obat utama untuk PlatformException / Channel Error
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Load Environment Variables (.env)
  try {
    await dotenv.load(fileName: ".env");
    debugPrint("Environment loaded successfully");
  } catch (e) {
    debugPrint("Error loading .env file: $e");
  }

  // 3. Inisialisasi Database (SQLite)
  // Pastikan database siap sebelum UI dibangun
  final dbService = DatabaseService();
  await dbService.database;
  await NotificationService.instance.initialize();
  await NotificationService.instance.scheduleMealReminders();

  // 4. Jalankan Aplikasi dengan MultiProvider
  runApp(
    MultiProvider(
      providers: [
        // Inisialisasi LoginProvider
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => BudgetProvider()),
        ChangeNotifierProvider(create: (_) => RecommendationProvider()),
        ChangeNotifierProvider(create: (_) => AiNutritionProvider()),

        /* 
           Si B bisa menambahkan provider di sini nanti, contoh:
           ChangeNotifierProvider(create: (_) => MealProvider()),
        */
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
      debugShowCheckedModeBanner: false,
      title: 'SmartBite',

      // Tema Aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        // Tambahkan font atau styling tambahan di sini jika perlu
      ),

      // Routing
      // Tip: Gunakan konstanta String untuk rute jika aplikasi semakin besar
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/ai_nutrition': (context) => const AiNutritionScreen(),
        '/account_settings': (context) => const AccountSettingsPage(),
        '/feedback': (context) => const FeedbackPage(),
      },
    );
  }
}
