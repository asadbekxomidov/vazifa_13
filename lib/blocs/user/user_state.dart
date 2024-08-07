abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final Map<String, dynamic> userData;

  UserLoaded(this.userData);
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}




// // user_state.dart
// import 'package:equatable/equatable.dart';

// abstract class UserState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class UserLoading extends UserState {}

// class UserLoaded extends UserState {
//   final Map<String, dynamic> userData; // Yagona foydalanuvchi ma'lumotlari

//   UserLoaded(this.userData);

//   @override
//   List<Object?> get props => [userData];
// }

// class UserError extends UserState {
//   final String message;

//   UserError(this.message);

//   @override
//   List<Object?> get props => [message];
// }


