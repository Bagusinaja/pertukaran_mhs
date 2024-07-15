import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:revisi_aplikasi_pertukaran_mahasiswa/singup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertukaran Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
    );
  }
}
