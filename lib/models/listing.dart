import 'dart:convert';

import 'package:equatable/equatable.dart';

class Listing extends Equatable {
  final String? title;
  final String? description;
  final String? country;
  final String? imageUrl;
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
    required this.country,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, description, country, imageUrl];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'label2': country,
    };
  }

  factory Listing.fromMap(Map<String, dynamic> map) {
    return Listing(
      title: map['title'],
      description: map['description'],
      reasonForSelling: map['reason_for_selling'],
      isAuctioned: map['is_auctioned'],
      isEstablished: map['is_established'],
      industry: map['industry'],
      country: map['country'],
      askingPrice: map['asking_price'] ?? 0,
      cashFlow: map['cash_flow'] ?? 0,
      grossRevenue: map['gross_revenue'] ?? 0,
      inventoryPrice: map['inventory_price'] ?? 0,
      netIncome: map['net_income'] ?? 0,
      imageUrl: map['image_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Listing.fromJson(Map<String, dynamic> source) => Listing.fromMap(source);
}
