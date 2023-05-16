part of 'milestone_bloc.dart';

abstract class MilestoneEvent extends Equatable {
  const MilestoneEvent();

  @override
  List<Object> get props => [];
}

class CreateMilestoneEvent extends MilestoneEvent {
  final String listingTitle;
  final String buyerName;
  final String mileStoneTitle;
  final DateTime startDate;
  final DateTime endDate;
  final String buyerId;
  final String sellerId;
  final String listingId;
  final VoidCallback onCompleted;
  const CreateMilestoneEvent({
    required this.buyerName,
    required this.mileStoneTitle,
    required this.startDate,
    required this.endDate,
    required this.listingTitle,
    required this.buyerId,
    required this.sellerId,
    required this.listingId,
    required this.onCompleted,
  });
}

class FetchMilestones extends MilestoneEvent {
  final String? buyerId;
  final String? sellerId;
  final String? listingId;
  const FetchMilestones({required this.buyerId, required this.sellerId, required this.listingId});
}

class DeleteMilestone extends MilestoneEvent {
  final String? milestoneId;
  final VoidCallback onComplete;
  const DeleteMilestone({required this.milestoneId, required this.onComplete});
}

class UpdateMilestone extends MilestoneEvent {
  final String? milestoneId;
  final String? milestoneTitle;
  final DateTime startDate;
  final DateTime endDate;

  final VoidCallback onComplete;

  const UpdateMilestone({required this.milestoneId, required this.milestoneTitle, required this.startDate, required this.endDate, required this.onComplete});
}

class MarkMilestone extends MilestoneEvent {
  final String? milestoneId;
  final VoidCallback onComplete;
  const MarkMilestone({
    required this.milestoneId,
    required this.onComplete,
  });
}
