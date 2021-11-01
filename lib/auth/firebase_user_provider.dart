import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HealthFirebaseUser {
  HealthFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

HealthFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HealthFirebaseUser> healthFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<HealthFirebaseUser>((user) => currentUser = HealthFirebaseUser(user));
