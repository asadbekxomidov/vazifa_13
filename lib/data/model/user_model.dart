import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  String id;
  String firstname;
  String lastname;
  String email;
  String imageUrl;

  ContactModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.imageUrl,
  });

  factory ContactModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ContactModel(
      id: doc.id,
      firstname: data['firstname'],
      lastname: data['lastname'],
      email: data['email'],
      imageUrl: data['imageUrl'],
    );
  }

  Future<List<ContactModel>> fetchContacts(List<String> userIds) async {
    List<ContactModel> contacts = [];
    for (String id in userIds) {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
      if (doc.exists) {
        contacts.add(ContactModel.fromDocumentSnapshot(doc));
      }
    }
    return contacts;
  }
}
