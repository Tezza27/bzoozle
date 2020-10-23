import 'package:bzoozle/models/testWord.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirestoreService _firestoreService =
      FirestoreService._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirestoreService._internal();
  factory FirestoreService() {
    return _firestoreService;
  }
  Future<void> addWord(TestWord testWord) {
    return _db.collection("testwords").add(testWord.toMap());
  }
}
