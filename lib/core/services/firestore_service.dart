import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get usersCollection =>
      _firestore.collection('users');

  Future<void> saveUserProfile({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await usersCollection.doc(userId).set(data, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    final snapshot = await usersCollection.doc(userId).get();
    if (!snapshot.exists) {
      return null;
    }
    return snapshot.data();
  }

  Future<void> saveDailyProgress({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await usersCollection
        .doc(userId)
        .collection('progress')
        .doc('daily')
        .set(data, SetOptions(merge: true));
  }

  Future<void> saveWeeklyChallengeProgress({
    required String userId,
    required String challengeId,
    required Map<String, dynamic> data,
  }) async {
    await usersCollection
        .doc(userId)
        .collection('weekly_challenges')
        .doc(challengeId)
        .set(data, SetOptions(merge: true));
  }
}
