import '../../../models/milestone.dart';

abstract class MileStoneRepository {
  Future<void> createNewMilestone({required Milestone milestone});
  Future<void> getMilestones({required String buyerId, required String sellerId, required String listingId});
  Future<void> deleteMileStone({required milestoneId});
  Future<void> markMilestone({required milestoneId});
  Future<void> updateMilestone({required milestoneId, required milestoneTitle, required DateTime startDate, required DateTime endDate});

  List<Milestone> get mileStones;
}
