import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/class_model.dart';

class ClassDataBaseService {
  // this database is use to store the class data
  final String class_code;
  ClassDataBaseService({required this.class_code});

  final CollectionReference classCollection =
      FirebaseFirestore.instance.collection("classes");

  Future<void> updateClassData(
      String class_name, String subject, String lecture_name, String user_id) async {
    return await classCollection.doc(class_code).set({
      'class name': class_name,
      'subject': subject,
      'lecture name': lecture_name,
      'user id': user_id,
    });
  }

  List<ClassModel> _classListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ClassModel(
          class_name: (doc.data() as dynamic)['class name'] ?? '',
          subject: (doc.data() as dynamic)['subject'] ?? '',
          lecture_name: (doc.data() as dynamic)['lecture name'] ?? '',
          user_id: (doc.data() as dynamic)['user id'] ?? '');
    }).toList();
  }

  Stream<List<ClassModel>> get classes {
    return classCollection.snapshots().map(_classListFromSnapshot);
  }
}
