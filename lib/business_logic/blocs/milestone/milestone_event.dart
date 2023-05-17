part of 'milestone_bloc.dart';

abstract class MilestoneEvent extends Equatable {
  const MilestoneEvent();

  @override
  List<Object> get props => [];
}

class CreateMilestoneEvent extends MilestoneEvent {
  final Milestone mileStone;
  final VoidCallback onCompleted;
  final VoidCallback onError;
  const CreateMilestoneEvent({required this.mileStone, required this.onCompleted, required this.onError});
}

class FetchMilestones extends MilestoneEvent {
  final String buyerId;
  final String sellerId;
  final String listingId;
  const FetchMilestones({required this.buyerId, required this.sellerId, required this.listingId});
}

class DeleteMilestone extends MilestoneEvent {
  final String? milestoneId;
  final VoidCallback onComplete;
  final VoidCallback onError;
  const DeleteMilestone({required this.milestoneId, required this.onComplete, required this.onError});
}

class UpdateMilestone extends MilestoneEvent {
  final String? milestoneId;
  final String? milestoneTitle;
  final DateTime startDate;
  final DateTime endDate;
  final VoidCallback onComplete;
  final VoidCallback onError;

  const UpdateMilestone({required this.milestoneId, required this.milestoneTitle, required this.startDate, required this.endDate, required this.onComplete, required this.onError});
}

class MarkMilestone extends MilestoneEvent {
  final String? milestoneId;
  final VoidCallback onComplete;
  final VoidCallback onError;
  const MarkMilestone({required this.milestoneId, required this.onComplete, required this.onError});
}
