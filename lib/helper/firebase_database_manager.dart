import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseManager {
  FirebaseDatabase firebaseDatabase = FirebaseDatabase();

  void test(args) {
    firebaseDatabase.goOnline();
  }
}
