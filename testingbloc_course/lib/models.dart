import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginHandle {
  final String token;

  const LoginHandle({
    required this.token,
  });

  const LoginHandle.foobar() : token = 'foobar';

  @override
  bool operator ==(covariant LoginHandle other) => token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() => 'LoginHandle (token = $token)';
}

enum LoginErrors {
  invalidHandle,
}

@immutable
class Notes {
  final String title;

  const Notes({
    required this.title,
  });

  @override
  String toString() => 'Note (title = $title)';
}

final mockNotes = Iterable.generate(
  3,
  (i) => Notes(title: 'Note ${(i + 1)}'),
);
