import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_metatube_app/bindings/bindings.dart';
import 'package:flutter_metatube_app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  if (!kIsWeb) {
    // Ensure that the widgets binding is initialized
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize the window manager
    await windowManager.ensureInitialized();

    // Define window options
    const windowOptions = WindowOptions(
      size: Size(1200, 800),
      minimumSize: Size(800, 600),
      center: true,
      title: "MetaTube",
    );

    // Wait until the window is ready to show
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  // Run the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      title: 'MetaTube',
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homePageRoute,
      getPages: AppRoutes.routes,
    );
  }
}
