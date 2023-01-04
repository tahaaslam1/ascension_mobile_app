import 'package:equatable/equatable.dart';

enum UserType {
  unknown,
  buyer,
  seller;
}

class User extends Equatable {
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? email;

  ///final UserType userType;

  const User({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    //  required this.userType,
  });

  factory User.fromMap(Map<String, dynamic> userMap) {
    // if( userMap['user_type'] == '1 ')
    return User(
      userId: userMap['user_id'],
      email: userMap['email'],
      firstName: userMap['first_name'],
      lastName: userMap['last_name'],
      //  userType: userType[]
    );
  }

  @override
  List<Object?> get props => [userId, firstName, lastName, email];

  static const empty = User(email: '-', firstName: '-', lastName: '-');
}
