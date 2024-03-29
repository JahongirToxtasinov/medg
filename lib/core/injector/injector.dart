import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> getItInjector() async {
  sl.registerSingletonAsync(() async => FirebaseAuth.instance);
  sl.registerSingletonAsync(() async => FirebaseFirestore.instance);
  sl.registerSingletonAsync(
        () async => SharedPreferences.getInstance(),
  );
}
