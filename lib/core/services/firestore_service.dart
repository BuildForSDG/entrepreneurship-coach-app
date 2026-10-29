import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get usersCollection =>
      _db.collection('users');

  Future<void> saveUserProfile({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    await usersCollection.doc(uid).set(data, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>?> getUserProfile(String uid) async {
    final doc = await usersCollection.doc(uid).get();
    if (!doc.exists) return null;
    return doc.data();
  }

  Future<void> saveUserProgress({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    await usersCollection
        .doc(uid)
        .collection('progress')
        .doc('summary')
        .set(data, SetOptions(merge: true));
  }

  Future<void> saveDailyAction({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    await usersCollection
        .doc(uid)
        .collection('daily_actions')
        .doc(DateTime.now().toIso8601String())
        .set(data);
  }

  Future<void> saveWeeklyChallengeProgress({
    required String uid,
    required String challengeId,
    required Map<String, dynamic> data,
  }) async {
    await usersCollection
        .doc(uid)
        .collection('weekly_challenges')
        .doc(challengeId)
        .set(data, SetOptions(merge: true));
  }
}
