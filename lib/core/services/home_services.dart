import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  CollectionReference _categoryReference =
      FirebaseFirestore.instance.collection("Categories");

  CollectionReference _productReference =
      FirebaseFirestore.instance.collection("Products");

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productReference.get();
    return value.docs;
  }
}
