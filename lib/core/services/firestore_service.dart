import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    // Create a CollectionReference called users that references the firestore collection
    await firestore.collection(path).add(data);
  }
}
