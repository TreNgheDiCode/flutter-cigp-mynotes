import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CIGP Notes'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              {
                final user = FirebaseAuth.instance.currentUser;

                if (user?.emailVerified ?? false) {
                  print('Xác nhận email thành công');
                } else {
                  print('Vui lòng xác nhận email tại hòm thư của bạn');
                }

                return const Text("Hoàn thành");
              }
            default:
              return const Text("Đang kết nối.....");
          }
        },
      ),
    );
  }
}
