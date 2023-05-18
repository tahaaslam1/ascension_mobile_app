import 'dart:convert';

import 'package:equatable/equatable.dart';

class Listing extends Equatable {
  final String listingId;
  final String title;
  final String description;
  final String city;
  // final String? country;
  final List<String> images;
  final int askingPrice;
  final int grossRevenue;
  final int cashFlow;
  final int inventoryPrice;
  final int netIncome;
  final bool isEstablished;
  final bool isAuctioned;
  final String industry;
  final String reasonForSelling;
  final List<String> assetsIncluded;
  final List<String> opportunities;
  final List<String> risks;
  final String? seller;


  const Listing({
    required this.listingId,
    this.askingPrice = 0,
    this.grossRevenue = 0,
    this.cashFlow = 0,
    this.inventoryPrice = 0,
    this.netIncome = 0,
    required this.isEstablished,
    required this.isAuctioned,
    this.industry = '-',
    this.reasonForSelling = '-',
    this.assetsIncluded = const <String>[],
    this.opportunities = const <String>[],
    this.risks = const <String>[],
    required this.title,
    required this.description,
    required this.city,
    required this.images,
    this.seller,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        city,
        images,
        askingPrice,
        grossRevenue,
        cashFlow,
        inventoryPrice,
        netIncome,
        isEstablished,
        isAuctioned,
        industry,
        reasonForSelling,
        assetsIncluded,
        opportunities,
        risks,
        listingId,
      ];

  Listing copyWith({
    String? listingId,
    String? title,
    String? description,
    String? city,
    List<String>? images,
    int? askingPrice,
    int? grossRevenue,
    int? cashFlow,
    int? inventoryPrice,
    int? netIncome,
    bool? isEstablished,
    bool? isAuctioned,
    String? industry,
    String? reasonForSelling,
    List<String>? assetsIncluded,
    List<String>? opportunities,
    List<String>? risks,
  }) {
    return Listing(
      listingId: listingId ?? this.listingId,
      title: title ?? this.title,
      description: description ?? this.description,
      city: city ?? this.city,
      images: images ?? this.images,
      askingPrice: askingPrice ?? this.askingPrice,
      grossRevenue: grossRevenue ?? this.grossRevenue,
      cashFlow: cashFlow ?? this.cashFlow,
      inventoryPrice: inventoryPrice ?? this.inventoryPrice,
      netIncome: netIncome ?? this.netIncome,
      isEstablished: isEstablished ?? this.isEstablished,
      isAuctioned: isAuctioned ?? this.isAuctioned,
      industry: industry ?? this.industry,
      reasonForSelling: reasonForSelling ?? this.reasonForSelling,
      assetsIncluded: assetsIncluded ?? this.assetsIncluded,
      opportunities: opportunities ?? this.opportunities,
      risks: risks ?? this.risks,
    );
  }

  factory Listing.fromMap(Map<String, dynamic> map) {
    return Listing(
      listingId: map['listing_id'],
      title: map['title'],
      description: map['description'],
      reasonForSelling: map['reason_for_selling'] ?? '-',
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
      seller: map['seller'] ?? '-',
    );
  }

  static const empty = Listing(title: '-', city: '-', description: '-', images: [], isAuctioned: false, isEstablished: false, listingId: '-');

  static String encode(List<Listing> listings) => json.encode(
        listings.map<Map<String, dynamic>>((listing) => Listing.toMap(listing)).toList(),
      );
  // String toJson() => json.encode(toMap());
  static Map<String, dynamic> toMap(Listing listing) {
    return {
      'listing_id': listing.listingId,
      'title': listing.title,
      'description': listing.description,
      'reason_for_selling': listing.reasonForSelling,
      'is_auctioned': listing.isAuctioned,
      'is_established': listing.isEstablished,
      'industry': listing.industry,
      'city': listing.city,
      'asking_price': listing.askingPrice,
      'cash_flow': listing.cashFlow,
      'gross_revenue': listing.grossRevenue,
      'inventory_price': listing.inventoryPrice,
      'net_income': listing.netIncome,
      'images': listing.images,
      'assets': listing.assetsIncluded,
      'opportunities': listing.opportunities,
      'risks': listing.risks,
    };
  }

  static List<Listing> decode(String listings) => (json.decode(listings) as List<dynamic>).map<Listing>((item) => Listing.fromMap(item)).toList();

  factory Listing.fromJson(Map<String, dynamic> source) => Listing.fromMap(source);
}
