import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAwDYGTv9iK1N1BcCZOF02l9eeEykIdX4A",
            authDomain: "zerohunger-89abb.firebaseapp.com",
            projectId: "zerohunger-89abb",
            storageBucket: "zerohunger-89abb.appspot.com",
            messagingSenderId: "266134230280",
            appId: "1:266134230280:web:0e35fbd0e7d07d884fc8bd",
            measurementId: "G-4Q3BMEP23M"));
  } else {
    await Firebase.initializeApp();
  }
}
