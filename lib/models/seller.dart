import 'package:ascension_mobile_app/models/listing.dart';
import 'package:ascension_mobile_app/models/user.dart';

class Seller extends User {
  final List<Listing> listings;

  const Seller({
    required super.email,
    required super.userType,
    required super.firstName,
    required super.lastName,
    required super.userId,
    this.listings = const [],
  });
  @override
  List<Object?> get props => super.props + [listings];
}
