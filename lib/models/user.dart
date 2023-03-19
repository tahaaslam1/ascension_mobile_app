import 'package:ascension_mobile_app/models/buyer.dart';
import 'package:ascension_mobile_app/models/seller.dart';
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
  final UserType userType;

  const User({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    required this.userType,
    //  required this.userType,
  });

  factory User.fromMap(Map<String, dynamic> userMap) {
    if (userMap['user_type'] == 1) {
      return Buyer(
        userId: userMap['user_id'],
        email: userMap['email'],
        firstName: userMap['first_name'],
        lastName: userMap['last_name'],
        userType: UserType.buyer,
      );
    } else {
      return Seller(
        userId: userMap['user_id'],
        email: userMap['email'],
        firstName: userMap['first_name'],
        lastName: userMap['last_name'],
        userType: UserType.seller,
      );
    }
  }

  @override
  List<Object?> get props => [userId, firstName, lastName, email];

  static const empty = User(email: '-', firstName: '-', lastName: '-', userType: UserType.unknown);
}
