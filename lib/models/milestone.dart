import 'package:equatable/equatable.dart';

class Milestone extends Equatable {
  final String milestoneId;
  final String milestoneTitle;
  final String buyerName;
  final DateTime startDate;
  final DateTime endDate;
  final String buyerId;
  final String sellerId;
  final String daysLeft;
  final bool isCompleted;

  Milestone({
    required this.milestoneId,
    required this.milestoneTitle,
    required this.buyerName,
    DateTime? startDate,
    DateTime? endDate,
    required this.buyerId,
    required this.sellerId,
    this.daysLeft = "",
    this.isCompleted = false,
  })  : startDate = startDate ?? DateTime.now(),
        endDate = endDate ?? DateTime.now();

  factory Milestone.fromMap(Map<String, dynamic> map) {
    return Milestone(
      milestoneId: map['id'],
      milestoneTitle: map['title'],
      buyerName: map['first_name'],
      startDate: map['startdate'],
      endDate: map['enddate'],
      buyerId: map['buyerid'],
      sellerId: map['sellerid'],
      daysLeft: map['remainingDays'],
      isCompleted: map['is_completed'],
    );
  }

  static var empty = Milestone(buyerId: '-', sellerId: '-', buyerName: '-', milestoneTitle: '-', isCompleted: false, milestoneId: '-');

  @override
  List<Object?> get props => [milestoneId, milestoneTitle, startDate, endDate, buyerId, sellerId, daysLeft, isCompleted];
}
