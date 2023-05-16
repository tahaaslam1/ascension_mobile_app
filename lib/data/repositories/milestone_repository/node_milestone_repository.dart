import 'package:ascension_mobile_app/data/repositories/milestone_repository/milestone_repository.dart';
import 'package:ascension_mobile_app/models/milestone.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:ascension_mobile_app/services/http/http_services.dart';

import 'package:dio/dio.dart';

import '../../../logger.dart';

class NodeMileStoneRepository extends MileStoneRepository {
  final HttpService httpClient;
  NodeMileStoneRepository({required this.httpClient});
  @override
  Future<Milestone?> createNewMilestone({required buyerName, required milestoneTitle, required buyerId, required startDate, required endDate, required sellerId, required listingId}) async {
    int stDate = (startDate.millisecondsSinceEpoch / 1000).round();

    int edDate = (endDate.millisecondsSinceEpoch / 1000).round();

    const String endpoint = '/createMileStone';
    try {
      final response = await httpClient.request<Map<String, dynamic>>(RequestMethod.post, endpoint, data: {'title': milestoneTitle, 'buyerId': buyerId, 'startdate': stDate, 'enddate': edDate, 'sellerId': sellerId, 'buyerName': buyerName, 'listing_id': listingId});
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<List<Milestone>?> getMilestones({required buyerId, required sellerId, required listingId}) async {
    List<Milestone> milestones = [];

    const String endpoint = '/milestone/getMileStone';
    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.get, endpoint, queryParameters: {'buyerId': buyerId, 'sellerId': sellerId, 'listingId': listingId});

      logger.wtf('Fetched ALl MIlestone Data Successfully');

      milestones = response.data['data'].map<Milestone>((res) => Milestone.fromMap(res)).toList();

      return milestones;
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<void> deleteMileStone({required milestoneId}) async {
    const String endpoint = '/milestone/deleteMilestone';
    try {
      await httpClient.request<Map<String, dynamic>>(RequestMethod.delete, endpoint, queryParameters: {'milestoneId': milestoneId});
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<void> markMilestone({required milestoneId}) async {
    const String endpoint = '/milestone/markCompleted';

    try {
      await httpClient.request<Map<String, dynamic>>(RequestMethod.put, endpoint, data: {'milestoneId': milestoneId});
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<void> updateMilestone({required milestoneId, required milestoneTitle, required startDate, required endDate}) async {
    const String endpoint = '/milestone/extendDueDate';

    Map<String, dynamic> milestoneData = {'milestoneId': milestoneId, 'title': milestoneTitle, 'startdate': startDate, 'enddate': endDate};

    try {
      await httpClient.request<Map<String, dynamic>>(RequestMethod.put, endpoint, data: milestoneData);
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }
}
