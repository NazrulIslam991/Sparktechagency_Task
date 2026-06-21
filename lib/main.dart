import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/resources/themes/app_theme.dart';
import 'core/routes/route_import_path.dart';
import 'core/routes/route_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

/// ************************ MY APP *******************************
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 820),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter App',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          onGenerateRoute: AppRouter.getRoute,
          initialRoute: RouteName.dashboardScreen,
        );
      },
    );
  }
}

/// android/app/main/kotlin/com/example/sparktechagency_task/MainActivity.kt
/// lib/core/services/device_info_service.dark
/// lib/core/services/lan_service.dark
/// lib/data/models/dashboard_state.dart
/// lib/data/models/received_data_model.dart
/// lib/data/models/received_data_state.dart
/// lib/data/sources/shared_preference.dart
/// lib/presentation/dashboard
/// lib/presentation/received_data_screen
/// lib/presentation/widgets
