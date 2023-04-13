import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ZerohungerFirebaseUser {
  ZerohungerFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ZerohungerFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ZerohungerFirebaseUser> zerohungerFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ZerohungerFirebaseUser>(
      (user) {
        currentUser = ZerohungerFirebaseUser(user);
        return currentUser!;
      },
    );
