import 'dart:convert';

import 'package:equatable/equatable.dart';

class Bids extends Equatable {
  final String? listingId;
  final int? bidValue;
  final String? sellerId;
  final String? buyerId;
  final String? sellerProfilePicture;
  final String? sellerPhoneNumber;
  final String? timeLeft;
  final String? firstName;
  final String? lastName;
 

  const Bids({
    this.lastName,
    this.firstName,
    this.bidValue,
    this.buyerId,
    this.sellerProfilePicture,
    this.sellerPhoneNumber,
    this.timeLeft,
    this.listingId,
    this.sellerId,
  });
  factory Bids.fromMap(Map<String, dynamic> map) {
    return Bids(
      listingId: map['listing_id'],
      sellerId: map['seller_id'],
      buyerId: map['buyer_id'],
      bidValue: map['bid_value'],
      sellerPhoneNumber: map['phone_number'],
      sellerProfilePicture: map['profile_picture'] ?? '',
      timeLeft: map['timeRemaining'],
      firstName: map['first_name'],
      lastName: map['last_name'],
    );
  }
  @override
  static const empty = Bids(buyerId: '-', sellerId: '-', listingId: '-');
  List<Object?> get props => [listingId, buyerId, sellerId];

  static List<Bids> decode(String bids) => (json.decode(bids) as List<dynamic>).map<Bids>((item) => Bids.fromMap(item)).toList();

  factory Bids.fromJson(Map<String, dynamic> source) => Bids.fromMap(source);
}
