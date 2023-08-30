import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventShouldRegister extends AuthEvent {
  const AuthEventShouldRegister();
}

class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;

  const AuthEventRegister(
    this.email,
    this.password,
  );
}

class AuthEventSendEmailVerification extends AuthEvent {
  const AuthEventSendEmailVerification();
}

class AuthEventLoggedIn extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLoggedIn(
    this.email,
    this.password,
  );
}

class AuthEventLoggedOut extends AuthEvent {
  const AuthEventLoggedOut();
}
