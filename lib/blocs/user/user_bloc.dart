// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'user_event.dart';
// import 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc() : super(UserInitial()) {
//     on<LoadUsersEvent>(_onLoadUsersEvent);
//   }

//   Future<void> _onLoadUsersEvent(
//       LoadUsersEvent event, Emitter<UserState> emit) async {
//     emit(UserLoading());
//     try {
//       final usersSnapshot =
//           await FirebaseFirestore.instance.collection('users').get();
//       final users = usersSnapshot.docs
//           .map((doc) => doc.data() as Map<String, dynamic>)
//           .toList();
//       emit(UsersLoaded(users));
//     } catch (e) {
//       emit(UserError(e.toString()));
//     }
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUsersEvent>(_onLoadUsersEvent);
  }

  Future<void> _onLoadUsersEvent(
      LoadUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final usersSnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      final users = usersSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
