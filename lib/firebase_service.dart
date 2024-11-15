import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static final FirebaseService _singleton = FirebaseService._internal();

  factory FirebaseService() => _singleton;

  FirebaseService._internal();

  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

  onListenUser(void Function(User?)? doListen) {
    auth.authStateChanges().listen(doListen);
  }

  bool isUserLoggedIn() {
    return auth.currentUser != null;
  }
}
