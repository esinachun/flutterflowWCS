import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WcsFirebaseUser {
  WcsFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

WcsFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WcsFirebaseUser> wcsFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<WcsFirebaseUser>((user) => currentUser = WcsFirebaseUser(user));
