import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todorr/core/presentation/config/app_config.dart';
import 'package:todorr/core/presentation/constants/route_constant.dart';
import 'package:todorr/core/presentation/path/path_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        final _mainkey = GlobalKey<FormState>();
    final FirebaseAuth auth = FirebaseAuth.instance;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      key: _mainkey,
      initialRoute: auth.currentUser==null?loginRoute:homeRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    onGenerateRoute:  RouteGenerator.generateRoute,
    );
  }
}

