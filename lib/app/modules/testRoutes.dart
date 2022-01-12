import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('Message');

    return FutureBuilder<DocumentSnapshot>(
      future: user.doc('test').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
/*          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['test']} ${data['test']}");*/
          /*user.doc('test')
              .set({
            'full_name': "123142", // John Doe
            'company': "123", // Stokes and Sons
            'age': "132" // 42
          })
              .then((value) => print("User Added"))
              .catchError((error) => print("Failed to add user: $error"));
          */
/*          var data = snapshot.data!.data();
          var value = data![0]; // <-- Your value
          return Text('Value = $value');*/
          return Text("123213");
        }

        return Text("loading");
      },
    );
  }
}
