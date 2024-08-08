// // abstract class UserState {}

// // class UserInitial extends UserState {}

// // class UserLoading extends UserState {}

// // // class UserLoaded extends UserState {
// // //   final Map<String, dynamic> userData;

// // //   UserLoaded(this.userData);
// // // }
// // class UsersLoaded extends UserState {
// //   final List<Map<String, dynamic>> users;

// //   UsersLoaded(this.users);

// //   @override
// //   List<Object> get props => [users];
// // }

// // class UserError extends UserState {
// //   final String message;

// //   UserError(this.message);
// // }



import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}


class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object> get props => [message];
}

class UsersLoaded extends UserState {
  final List<Map<String, dynamic>> users;

  UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}



// part of 'user_bloc.dart';

// abstract class UserState extends Equatable {
//   const UserState();

//   @override
//   List<Object> get props => [];
// }

// class UserInitial extends UserState {}

// class UserLoading extends UserState {}

// class UserLoaded extends UserState {
//   final Map<String, dynamic> user;

//   UserLoaded(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class UsersLoaded extends UserState {
//   final List<Map<String, dynamic>> users;

//   UsersLoaded(this.users);

//   @override
//   List<Object> get props => [users];
// }

// class UserError extends UserState {
//   final String message;

//   UserError(this.message);

//   @override
//   List<Object> get props => [message];
// }
