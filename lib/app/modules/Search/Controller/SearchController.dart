import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  var result = [].obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void searchFriend(String data) async{
    if(data.length ==0){
      result.value = [];
    }
    else{
      CollectionReference clients = await firebaseFirestore.collection('Clients');
     // print(clients.doc());
      final resultFr = await clients.where("Email", isEqualTo: data).get();
      if(resultFr.docs.length >0){
        for(int i = 0; i<resultFr.docs.length; i++){
          result.add(resultFr.docs[i].data() as Map<String,dynamic>);
        }
        print(result);
      }
    }
    result.refresh();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}