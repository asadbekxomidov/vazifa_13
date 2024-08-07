import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';

class UsersFirebaseServices {
  final usersCollection = FirebaseFirestore.instance.collection("users");
  final usersImageStorage = FirebaseStorage.instance;

  Stream<QuerySnapshot> getUsers() async* {
    yield* usersCollection.snapshots();
  }

  Stream<DocumentSnapshot> getUserById(String id) {
    return usersCollection.doc(id).snapshots();
  }

  void addUser(String firstname, String lastname, String email, File? image) {
    if (image != null) {
      final imageReference = usersImageStorage
          .ref()
          .child("users")
          .child("images")
          .child("${randomAlphaNumeric(16)}.jpg");
      final uploadTask = imageReference.putFile(
        image,
      );

      uploadTask.snapshotEvents.listen((status) {});

      uploadTask.whenComplete(() async {
        final imageUrl = await imageReference.getDownloadURL();
        usersCollection.doc(FirebaseAuth.instance.currentUser!.uid).set({
          'firstname': firstname,
          'lastname': lastname,
          "email": email,
          'imageUrl': imageUrl,
        });
      });
    }
  }

  Future<void> editUser(
      String firstname, String lastname, String userId, var image) async {
    final userssection = await usersCollection.doc(userId).get();
    final user = userssection.data();
    user!['firstname'] = firstname;
    user['lastname'] = lastname;
    if (image != null) {
      final imageReference = usersImageStorage
          .ref()
          .child("users")
          .child("images")
          .child("${randomAlphaNumeric(16)}.jpg");
      final uploadTask = imageReference.putFile(
        image,
      );
      uploadTask.snapshotEvents.listen((status) {});
      uploadTask.whenComplete(() async {
        final imageUrl = await imageReference.getDownloadURL();
        usersCollection.doc(userId).update({
          'firstname': user['firstname'],
          'lastname': user['lastname'],
          'imageUrl': user['imageUrl'],
        });
      });
    }
  }
}
