import 'package:equatable/equatable.dart';

class Milestone extends Equatable {
  final String? milestoneId;
  final String? milestoneTitle;
  final String buyerName;
  final String? startDate;
  final String? endDate;
  final String? buyerId;
  final String? sellerId;
  final String daysLeft;
  final bool? is_completed;

  const Milestone(
      {this.milestoneId,
      this.milestoneTitle,
      required this.buyerName,
      this.startDate,
      this.endDate,
      this.buyerId,
      this.sellerId,
      this.daysLeft = "",
      this.is_completed,
      });
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
      is_completed: map['is_completed'],
    );
  }
  @override
  static const empty = Milestone(buyerId: '-', sellerId: '-', buyerName: '-');
  List<Object?> get props => [milestoneId, milestoneTitle, startDate, endDate];
}
