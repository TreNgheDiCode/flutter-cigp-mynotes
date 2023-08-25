import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng ký'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Nhập email của bạn",
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Nhập mật khẩu của bạn",
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                final user = FirebaseAuth.instance.currentUser;
                user?.sendEmailVerification();
                if (!mounted) return;
                Navigator.of(context).pushNamed(verifyEmailRoute);
              } on FirebaseAuthException catch (e) {
                if (mounted) {
                  if (e.code == 'email-already-in-use') {
                    await showErrorDialog(
                      context,
                      "Địa chỉ email đã được sử dụng",
                    );
                  } else if (e.code == 'weak-password') {
                    await showErrorDialog(
                      context,
                      'Mật khẩu yếu, vui lòng nhập mật khẩu mới mạnh hơn',
                    );
                  } else if (e.code == 'invalid-email') {
                    await showErrorDialog(
                      context,
                      "Vui lòng nhập một địa chỉ email chính xác",
                    );
                  } else {
                    await showErrorDialog(
                      context,
                      'Lỗi: ${e.code}',
                    );
                  }
                }
              } catch (e) {
                if (!mounted) return;
                await showErrorDialog(context, e.toString());
              }
            },
            child: const Text('Đăng ký'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            child: const Text('Đã có tài khoản? Đăng nhập tại đây!'),
          )
        ],
      ),
    );
  }
}
