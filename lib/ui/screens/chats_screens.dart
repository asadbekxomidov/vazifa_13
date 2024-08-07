import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa_13/blocs/user/user_bloc.dart';
import 'package:vazifa_13/blocs/user/user_event.dart';
import 'package:vazifa_13/blocs/user/user_state.dart';
import 'package:vazifa_13/ui/screens/auth/login_screen.dart';

class ChatsScreens extends StatefulWidget {
  @override
  State<ChatsScreens> createState() => _ChatsScreensState();
}

class _ChatsScreensState extends State<ChatsScreens> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Conversations',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => LoginScreen()));
                },
                icon: Icon(Icons.logout)),
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is UserError) {
              return Center(
                  child: Text('Something went wrong: ${state.message}'));
            }
            if (state is UserLoaded) {
              var userData = state.userData;
              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  ListTile(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (ctx) => UsersChatsRoomWidget(contactModel: FirebaseAuth.instance.currentUser!.uid,)));
                    },
                    leading: userData['imageUrl'] != null &&
                            userData['imageUrl'].isNotEmpty
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(userData['imageUrl']),
                          )
                        : CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                    title: Text(userData['firstname'] ?? 'No Name'),
                    subtitle: Text(userData['email'] ?? 'No Email'),
                    isThreeLine: false,
                  ),
                ],
              );
            }
            return Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}












// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vazifa_13/blocs/user/user_bloc.dart';
// import 'package:vazifa_13/blocs/user/user_event.dart';
// import 'package:vazifa_13/blocs/user/user_state.dart';
// import 'package:vazifa_13/data/model/user_model.dart';
// import 'package:vazifa_13/ui/screens/auth/login_screen.dart';
// import 'package:vazifa_13/ui/widgets/users_chats_room_widget.dart';

// class ChatsScreens extends StatefulWidget {
//   @override
//   State<ChatsScreens> createState() => _ChatsScreensState();
// }

// class _ChatsScreensState extends State<ChatsScreens> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UserBloc()..add(LoadUserEvent()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Conversations',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           actions: [
//             IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
//             IconButton(
//                 onPressed: () {
//                   FirebaseAuth.instance.signOut();
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (ctx) => LoginScreen()));
//                 },
//                 icon: Icon(Icons.logout)),
//           ],
//         ),
//         body: BlocBuilder<UserBloc, UserState>(
//           builder: (context, state) {
//             if (state is UserLoading) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (state is UserError) {
//               return Center(
//                   child: Text('Something went wrong: ${state.message}'));
//             }
//             if (state is UserLoaded) {
//               // `state.userData` ni to'g'ri turga mos ravishda ishlating
//               Map<String, dynamic> userDataMap = state.userData;

//               List<ContactModel> contacts = userDataMap.entries
//                   .map((entry) {
//                     // Bu yerda har bir entry qiymatini to'g'ri turga mos ravishda o'zgartiring
//                     var data = entry.value as Map<String, dynamic>;
//                     return ContactModel(
//                       id: data['id'],
//                       firstname: data['firstname'],
//                       lastname: data['lastname'],
//                       email: data['email'],
//                       imageUrl: data['imageUrl'],
//                     );
//                   })
//                   .where((contact) =>
//                       contact.id != FirebaseAuth.instance.currentUser!.uid)
//                   .toList();

//               return ListView.builder(
//                 padding: const EdgeInsets.all(20),
//                 itemCount: contacts.length,
//                 itemBuilder: (context, index) {
//                   ContactModel contact = contacts[index];
//                   return ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (ctx) => UsersChatsRoomWidget(contactModel: contact),
//                         ),
//                       );
//                     },
//                     leading: contact.imageUrl.isNotEmpty
//                         ? CircleAvatar(
//                             backgroundImage: NetworkImage(contact.imageUrl),
//                           )
//                         : CircleAvatar(
//                             child: Icon(Icons.person),
//                           ),
//                     title: Text('${contact.firstname} ${contact.lastname}'),
//                     subtitle: Text(contact.email),
//                     isThreeLine: false,
//                   );
//                 },
//               );
//             }
//             return Center(child: Text('No data available'));
//           },
//         ),
//       ),
//     );
//   }
// }

