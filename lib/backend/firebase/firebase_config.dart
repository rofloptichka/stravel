import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAZd40pq4TvjgzzNqBfL11QNm-kTiROK8k",
            authDomain: "fir-travel-dwmlrw.firebaseapp.com",
            projectId: "s-travel-dwmlrw",
            storageBucket: "s-travel-dwmlrw.appspot.com",
            messagingSenderId: "958637047127",
            appId: "1:958637047127:web:f7f2ea00e5bcf9aca05212"));
  } else {
    await Firebase.initializeApp();
  }
}
