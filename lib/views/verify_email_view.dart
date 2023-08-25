import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác thực Email'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Text('Xin vui lòng kiểm tra hòm thư để xác thực email của bạn'),
          const Text(
              'Trong trường hợp chưa nhận được email, xin vui lòng nhấn nút gửi lại bên dưới'),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('Gửi lại email xác nhận'),
          ),
          TextButton(
            onPressed: () async {
              if (!mounted) return;
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
              await AuthService.firebase().logOut();
            },
            child: const Text('Quay về trang đăng nhập'),
          )
        ],
      ),
    );
  }
}
