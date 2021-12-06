import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/enrolled_model.dart';

class EnrolledDataBaseService {
  // this database is use to store the class data
  String uid;
  EnrolledDataBaseService({required this.uid});

  late final CollectionReference enrolledCollection =
      FirebaseFirestore.instance.collection(uid);

  Future<void> updateEnrolledData(String class_name, String class_code,
      String subject, String lecture_name) async {
    return await enrolledCollection.doc(class_code).set({
      'class name': class_name,
      'subject': subject,
      'lecture name': lecture_name,
    });
  }

  List<EnrolledModel> _enrolledListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return EnrolledModel(
          class_name: (doc.data() as dynamic)['class name'] ?? '',
          subject: (doc.data() as dynamic)['subject'] ?? '',
          lecture_name: (doc.data() as dynamic)['lecture name'] ?? '');
    }).toList();
  }

  Stream<List<EnrolledModel>> get enrolled {
    return enrolledCollection.snapshots().map(_enrolledListFromSnapshot);
  }
}
