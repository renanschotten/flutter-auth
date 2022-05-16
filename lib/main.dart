import 'package:auth/firebase_options.dart';
import 'package:auth/modules/auth/view/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/sign_up",
      routes: {
        "/sign_up": (context) => const SignUpPage(),
      },
    );
  }
}
