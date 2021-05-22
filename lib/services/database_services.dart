import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/employee_model.dart';

class DatabaseService {
  static DatabaseService databaseServiceInstance = DatabaseService();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

   Future<QuerySnapshot> getUsers(
    int limit, {
    DocumentSnapshot startAfter,
  }) async {
    final refUsers = FirebaseFirestore.instance
        .collection('employees')
        .orderBy('firstName')
        .limit(limit);

    if (startAfter == null) {
      return refUsers.get();
    } else {
      return refUsers.startAfterDocument(startAfter).get();
    }
  }
}
