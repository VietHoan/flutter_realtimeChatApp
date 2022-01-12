import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  var conTact = [].obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void showContact() async{
    CollectionReference collectionReference = await firebaseFirestore.collection('Users');
    final listContact = await collectionReference.get();
    for(int i=0; i<listContact.size;i++){
      conTact.add(listContact.docs[i].data() as Map<String,dynamic>);
    }
    conTact.refresh();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}