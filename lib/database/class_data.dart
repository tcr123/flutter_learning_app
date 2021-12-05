import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/class_model.dart';

class ClassDataBaseService {
  // this database is use to store the class data

  final CollectionReference classCollection =
      FirebaseFirestore.instance.collection("classes");

  Future<void> updateClassData(
      String class_name, String class_code, String subject, String lecture_name, String user_id) async {
    return await classCollection.doc().set({
      'class name': class_name,
      'class code': class_code,
      'subject': subject,
      'lecture name': lecture_name,
      'user id': user_id,
    });
  }

  List<ClassModel> _classListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ClassModel(
          class_name: (doc.data() as dynamic)['class name'] ?? '',
          class_code: (doc.data() as dynamic)['class code'] ?? '',
          subject: (doc.data() as dynamic)['subject'] ?? '',
          lecture_name: (doc.data() as dynamic)['lecture name'] ?? '',
          user_id: (doc.data() as dynamic)['user id'] ?? '');
    }).toList();
  }

  Stream<List<ClassModel>> get classes {
    return classCollection.snapshots().map(_classListFromSnapshot);
  }
}
