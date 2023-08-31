import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';

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
        centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        title: const Text('Xác thực Email'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Text('Xin vui lòng kiểm tra hòm thư để xác thực email của bạn'),
          const Text(
              'Trong trường hợp chưa nhận được email, xin vui lòng nhấn nút gửi lại bên dưới'),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    const AuthEventSendEmailVerification(),
                  );
            },
            child: const Text('Gửi lại email xác nhận'),
          ),
          TextButton(
            onPressed: () async {
              context.read<AuthBloc>().add(
                    const AuthEventLoggedOut(),
                  );
            },
            child: const Text('Quay về trang đăng nhập'),
          )
        ],
      ),
    );
  }
}
