import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBQzkczvCsm3W-noGw2NsdbP52yFP0oNvY",
            authDomain: "bikerideireland-6f900.firebaseapp.com",
            projectId: "bikerideireland-6f900",
            storageBucket: "bikerideireland-6f900.appspot.com",
            messagingSenderId: "371032130556",
            appId: "1:371032130556:web:5199962ac5b7c4473c2879"));
  } else {
    await Firebase.initializeApp();
  }
}
