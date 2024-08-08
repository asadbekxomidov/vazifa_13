import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa_13/blocs/user/user_bloc.dart';
import 'package:vazifa_13/blocs/user/user_event.dart';
import 'package:vazifa_13/blocs/user/user_state.dart';
import 'package:vazifa_13/ui/screens/auth/login_screen.dart';
import 'package:vazifa_13/ui/widgets/users_chats_room_widget.dart';

class ChatsScreens extends StatefulWidget {
  @override
  State<ChatsScreens> createState() => _ChatsScreensState();
}

class _ChatsScreensState extends State<ChatsScreens> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(LoadUsersEvent()),
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
            if (state is UsersLoaded) {
              var usersData = state.users;
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: usersData.length,
                itemBuilder: (context, index) {
                  var userData = usersData[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => ChatRoomScreen(messages: []),
                        ),
                      );
                    },
                    leading: userData['imageUrl'] != null &&
                            userData['imageUrl'].isNotEmpty
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(userData['imageUrl']),
                          )
                        : CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                    title: Text(userData['firstname'] ?? 'no name'),
                    subtitle: Text(userData['email'] ?? 'no email'),
                    isThreeLine: false,
                  );
                },
              );
            }
            return Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
