import 'package:flutter/foundation.dart' show immutable;

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingScrenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScrenController({
    required this.close,
    required this.update,
  });
}
