import '../../../models/milestone.dart';

abstract class MileStoneRepository {
  Future<void> createNewMilestone({required buyerName, required milestoneTitle, required buyerId, required startDate, required endDate, required sellerId, required listingId});
  Future<List<Milestone>> getMilestones({required buyerId, required sellerId, required listingId});
  Future<void> deleteMileStone({required milestoneId});
  Future<void> markMilestone({required milestoneId});
  Future<void> updateMilestone({required milestoneId, required milestoneTitle, required DateTime startDate, required DateTime endDate});
}
