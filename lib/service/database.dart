import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/customer.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference clietCollection =
      FirebaseFirestore.instance.collection("customers");

  Future<void> updateUserData(String classes, String name, int token) async {
    return await clietCollection.doc(uid).set({
      'classes': classes,
      'name': name,
      'token': token,
    });
  }

  List<Customer> _customerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Customer(
          name: (doc.data() as dynamic)['name'] ?? '',
          classes: (doc.data() as dynamic)['classes'] ?? '0',
          token: (doc.data() as dynamic)['token'] ?? 0
        );
    }).toList();
  }

  Stream<List<Customer>> get customers {
    return clietCollection.snapshots().map(_customerListFromSnapshot);
  }
}
