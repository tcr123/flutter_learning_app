import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/customer.dart';
import 'package:demo/models/class_model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference clietCollection =
      FirebaseFirestore.instance.collection("customers");

  Future<void> updateUserData(String classes, String name, int score) async {
    return await clietCollection.doc(uid).set({
      'classes': classes,
      'name': name,
      'score': score,
    });
  }

  Future<void> updateClassListData(List<ClassModel> class_data) async {
    return await clietCollection.doc(uid).set({
      'class data': class_data,
    });
  }

  List<Customer> _customerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Customer(
          name: (doc.data() as dynamic)['name'] ?? '',
          classes: (doc.data() as dynamic)['classes'] ?? '0',
          score: (doc.data() as dynamic)['score'] ?? 0,
        );
    }).toList();
  }

  Stream<List<Customer>> get customers {
    return clietCollection.snapshots().map(_customerListFromSnapshot);
  }
}
