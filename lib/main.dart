import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/resources/themes/app_theme.dart';
import 'core/routes/route_import_path.dart';
import 'core/routes/route_name.dart';

/// ************************ main class *******************************
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

/// ************************ MyApp class *******************************
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      /// ********* screen utils code **********
      designSize: Size(360, 820),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter App',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,

          ///  ****** theme code  **********
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,

          ///  ****** route code  *********
          onGenerateRoute: AppRouter.getRoute,
          initialRoute: RouteName.splashScreen,
        );
      },
    );
  }
}
