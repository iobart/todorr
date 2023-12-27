import 'package:firebase_core/firebase_core.dart';
import 'package:todorr/core/di/locator.dart';

Future<void> initAppConfig() async {
  await Firebase.initializeApp();
  setUpLocator();
}
