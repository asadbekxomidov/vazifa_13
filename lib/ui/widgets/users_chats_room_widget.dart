import 'package:flutter/material.dart';
import 'package:vazifa_13/data/model/user_model.dart';

class UsersChatsRoomWidget extends StatefulWidget {
  final ContactModel contactModel;

  const UsersChatsRoomWidget({required this.contactModel});

  @override
  State<UsersChatsRoomWidget> createState() => _UsersChatsRoomWidgetState();
}

class _UsersChatsRoomWidgetState extends State<UsersChatsRoomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.contactModel.firstname} ${widget.contactModel.lastname}'), // userning ismi va familiyasi AppBar title qismida ko'rinadi
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.contactModel.imageUrl.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage(widget.contactModel.imageUrl),
                  radius: 50,
                )
              : CircleAvatar(
                  child: Icon(Icons.person),
                  radius: 50,
                ),
            SizedBox(height: 10),
            Text('${widget.contactModel.firstname} ${widget.contactModel.lastname}', style: TextStyle(fontSize: 20)),
            Text(widget.contactModel.email, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
