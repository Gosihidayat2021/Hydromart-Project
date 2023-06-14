import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProduct {
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getProductsFromFirestore() async {
    var value = await _productsCollection.get();
    return value.docs;
  }
}
