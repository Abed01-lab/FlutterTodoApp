import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseConnection {
  static final db = FirebaseFirestore.instance.collection('todos');
}
