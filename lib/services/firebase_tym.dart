
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTym {
  final CollectionReference tym = FirebaseFirestore.instance.collection("love");
  Future<void> addLove(
    String id,
    String idUser,
    String images,
    String name,
    String cart,
    String brand,
    String priceNew,
    String priceOld,
    String disposion,
  ) async {
    try {
      await tym.doc(id).set({
        "_id": id,
        "id_user": idUser,
        "name": name,
        "cart": cart,
        "brand": brand,
        "priceNew": priceNew,
        "priceOld": priceOld,
        "images": images,
        "description": disposion,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

Stream<QuerySnapshot> getTym(String userId) {
  return FirebaseFirestore.instance
      .collection('love') // Thay 'your_collection_name' bằng tên thực của bảng/collection
      .where('id_user', isEqualTo: userId)
      .snapshots();
}

  Future<void> deleteLoveData(String id) async {
    try {
      await tym.doc(id).delete();
      // ignore: avoid_print
      print("Love data deleted successfully");
    } catch (e) {
      // Handle errors
      // ignore: avoid_print
      print("Error deleting love data: $e");
    }
  }
}
