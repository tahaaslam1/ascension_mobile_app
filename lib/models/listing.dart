import 'dart:convert';

import 'package:equatable/equatable.dart';

class Listing extends Equatable {
  final String listingId;
  final String? title;
  final String? description;
  final String city;
  // final String? country;
  final List<String> images;
  final int? askingPrice;
  final int? grossRevenue;
  final int? cashFlow;
  final int? inventoryPrice;
  final int? netIncome;
  final bool isEstablished;
  final bool isAuctioned;
  final String? industry;
  final String? reasonForSelling;
  final List<String>? assetsIncluded;
  final List<String>? opportunities;
  final List<String>? risks;

  const Listing({
    required this.listingId,
    this.askingPrice,
    this.grossRevenue,
    this.cashFlow,
    this.inventoryPrice,
    this.netIncome,
    required this.isEstablished,
    required this.isAuctioned,
    this.industry,
    this.reasonForSelling,
    this.assetsIncluded,
    this.opportunities,
    this.risks,
    required this.title,
    required this.description,
    required this.city,
    // required this.country,
    required this.images,
  });

  @override
  List<Object?> get props => [title, description, city, images];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'label2': city,
    };
  }

  factory Listing.fromMap(Map<String, dynamic> map) {
    return Listing(
      listingId: map['listing_id'],
      title: map['title'],
      description: map['description'],
      reasonForSelling: map['reason_for_selling'],
      isAuctioned: map['is_auctioned'] ?? true,
      isEstablished: map['is_established'] ?? true,
      industry: map['industry'],
      city: map['city'],
      // country: map['country'],
      askingPrice: map['asking_price'] ?? 0,
      cashFlow: map['cash_flow'] ?? 0,
      grossRevenue: map['gross_revenue'] ?? 0,
      inventoryPrice: map['inventory_price'] ?? 0,
      netIncome: map['net_income'] ?? 0,
      images: map['images'].isNotEmpty ? map['images'].cast<String>() : ["https://cloudinary.hbs.edu/hbsit/image/upload/s--Fm3oHP0m--/f_auto,c_fill,h_375,w_750,/v20200101/79015AB87FD6D3284472876E1ACC3428.jpg"],
      assetsIncluded: map['assets'] != null ? map['assets'].cast<String>() : [],
      opportunities: map['opportunities'] != null ? map['opportunities'].cast<String>() : [],
      risks: map['risks'] != null ? map['risks'].cast<String>() : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Listing.fromJson(Map<String, dynamic> source) => Listing.fromMap(source);
}
