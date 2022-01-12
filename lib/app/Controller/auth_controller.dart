import 'package:chatproject/app/data/models/testUser_model..dart';
import 'package:chatproject/app/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var userModel = UserModel().obs;
  static User? curUser;

  // GoogleSignIn _googleSignIn = new GoogleSignIn();
  // GoogleSignInAccount? _account;
  // final auth = FirebaseAuth.instance;

  // Future<void> signInWithGoogle() async {
  //   try {
  //     await _googleSignIn.signOut();
  //     await _googleSignIn.signIn().then((value) => _account = value);
  //     await _googleSignIn.isSignedIn().then((value) => {
  //       if(value){
  //         print(value),
  //       }
  //       else{
  //         print("12312321"),
  //       }
  //     });
  //     print(_account);
  //   } catch (error) {
  //     print(error);
  //   }
  // } // lg
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static Future<User?> loginWithEmail(
      {required String email,
      required String password,
      required BuildContext buildContext}) async {
    User? user;
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      curUser = user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Wrong");
      }
    }
    return user;
  }

  void toHomeScreen(String email, String password, BuildContext context) async {
    User? user = await loginWithEmail(
        email: email, password: password, buildContext: context);
    if (user != null) {
      CollectionReference users = firebaseFirestore.collection('Users');
      final curUser = await users.doc(user.email).get();
      if (!curUser.exists) {
        await users.doc(user.email).set({
          'uid': user.uid,
          'email': user.email,
          'name': 'test',
          'chats': []
        });
      }
      final curUserData = curUser.data() as Map<String, dynamic>;
      userModel(UserModel.fromJson(curUserData));
      Get.toNamed(Routes.HomeChatScreen);
    } else {
      print('ko co user!!');
    }
  }

  Future<void> logOut() async {
    await firebaseAuth.signOut();
    Get.toNamed(Routes.Login);
  }

  void toSearchScreen() {
    Get.toNamed(Routes.Search);
  }

  void toChatRoomScreen() {
    print(curUser!.email);
    Get.toNamed(Routes.ChatRoom);
  }

  void toConnectChat(String frEmail) async {
    bool newConnection = false;
    CollectionReference chats = firebaseFirestore.collection('chats');
    CollectionReference users = firebaseFirestore.collection('Users');
    var chat_id;
    final docUser = await users.doc(curUser!.email).get();
    final docChats = (docUser.data() as Map<String, dynamic>)["chats"] as List;

    if (docChats.length != 0) {
      docChats.forEach((element) {
        if (element["connection"] == frEmail) {
          chat_id = element["chat_id"];
        }
      });

      if (chat_id != null) {
        newConnection = false;
      } else {
        newConnection = true;
      }
    }

    if (newConnection) {
      final newChatDoc = await chats.add({
        "connection": [
          curUser!.email,
          frEmail,
        ],
        "total_chats": 0,
        "total_read": 0,
        "total_unread": 0,
        "chat": [],
      });

      await users.doc(curUser!.email).update({
        "chat": [
          {
            "connection": frEmail,
            "chat_id": newChatDoc.id,
          }
        ]
      });
      userModel.update((user) {
        user!.chat = [ChatUser(chatId: newChatDoc.id, connection: frEmail)];
      });
      chat_id = newChatDoc.id;
      userModel.refresh();
    }
    print(chat_id);
    Get.toNamed(Routes.ChatRoom);
  }
}
