import 'package:equatable/equatable.dart';

enum UserType {
  unknown,
  buyer,
  seller, candidate;
}

class User extends Equatable {
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;

  const User({
    this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  List<Object?> get props => [userId, firstName, lastName, email];

  static const empty = User(email: '-', firstName: '-', lastName: '-');
}
