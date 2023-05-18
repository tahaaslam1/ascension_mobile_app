import 'package:equatable/equatable.dart';

import '../logger.dart';

class Milestone extends Equatable {
  final String? milestoneId;
  final String milestoneTitle;
  final String buyerName;
  final DateTime startDate;
  final DateTime endDate;
  final String buyerId;
  final String sellerId;
  final String daysLeft;
  final bool isCompleted;
  final String listingId;

  Milestone({
    this.milestoneId,
    required this.milestoneTitle,
    required this.buyerName,
    DateTime? startDate,
    DateTime? endDate,
    required this.buyerId,
    required this.sellerId,
    this.daysLeft = "",
    this.isCompleted = false,
    required this.listingId,
  })  : startDate = startDate ?? DateTime.now(),
        endDate = endDate ?? DateTime.now();

  factory Milestone.fromMap(Map<String, dynamic> map) {
    return Milestone(
      milestoneId: map['id'] ?? '-',
      milestoneTitle: map['title'],
      buyerName: map['first_name'],
      startDate: DateTime.parse(map['startdate']) ,
      endDate: DateTime.parse(map['enddate']),
      buyerId: map['buyerid'] ?? '-',
      sellerId: map['sellerid'] ?? '-',
      daysLeft: map['remainingDays'].toString(),
      isCompleted: map['is_completed'],
      listingId: map['listing_id'],
    );
  }

  Milestone copyWith({
    String? milestoneId,
    String? milestoneTitle,
    String? buyerName,
    DateTime? startDate,
    DateTime? endDate,
    String? buyerId,
    String? sellerId,
    String? daysLeft,
    bool? isCompleted,
    String? listingId,
  }) {
    return Milestone(
      milestoneId: milestoneId ?? this.milestoneId,
      milestoneTitle: milestoneTitle ?? this.milestoneTitle,
      buyerName: buyerName ?? this.buyerName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      buyerId: buyerId ?? this.buyerId,
      sellerId: sellerId ?? this.sellerId,
      daysLeft: daysLeft ?? this.daysLeft,
      isCompleted: isCompleted ?? this.isCompleted,
      listingId: listingId ?? this.listingId,
    );
  }

  static var empty = Milestone(buyerId: '-', sellerId: '-', buyerName: '-', milestoneTitle: '-', isCompleted: false, milestoneId: '-', listingId: '-');

  @override
  List<Object?> get props => [milestoneId, milestoneTitle, startDate, endDate, buyerId, sellerId, daysLeft, isCompleted, listingId];
}
