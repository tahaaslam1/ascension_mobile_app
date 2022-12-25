import 'package:equatable/equatable.dart';

enum UserType {
  unknown,
  buyer,
  seller;
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

  factory User.fromMap(Map<String, dynamic> userMap) {
    return User(
      userId: userMap['user_id'],
      email: userMap['email'],
      firstName: userMap['first_name'],
      lastName: userMap['last_name'],
    );
  }

  @override
  List<Object?> get props => [userId, firstName, lastName, email];

  static const empty = User(email: '-', firstName: '-', lastName: '-');
}
