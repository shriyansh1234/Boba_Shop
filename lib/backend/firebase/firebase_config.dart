import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDTk9Hy6R1XPh7Xwiyx_xCdhBb_KJnxJ5o",
            authDomain: "todoapp-5af83.firebaseapp.com",
            projectId: "todoapp-5af83",
            storageBucket: "todoapp-5af83.appspot.com",
            messagingSenderId: "904202929181",
            appId: "1:904202929181:web:17e02484ea17c9613df2f4"));
  } else {
    await Firebase.initializeApp();
  }
}
