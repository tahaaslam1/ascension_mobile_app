import 'package:ascension_mobile_app/data/repositories/milestone_repository/milestone_repository.dart';
import 'package:ascension_mobile_app/models/milestone.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:ascension_mobile_app/services/http/http_services.dart';

import 'package:dio/dio.dart';

import '../../../logger.dart';

class NodeMileStoneRepository extends MileStoneRepository {
  final HttpService httpClient;

  final List<Milestone> _mileStones = [];

  NodeMileStoneRepository({required this.httpClient});
  @override
  Future<void> createNewMilestone({required Milestone milestone}) async {
    const String endpoint = '/milestone/createMileStone';
    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.post, endpoint, data: {
        'title': milestone.milestoneTitle,
        'buyerId': milestone.buyerId,
        'startdate': (milestone.startDate.millisecondsSinceEpoch / 1000).round(),
        'enddate': (milestone.startDate.millisecondsSinceEpoch / 1000).round(),
        'sellerId': milestone.sellerId,
        'buyerName': milestone.buyerName,
        'listing_id': milestone.listingId,
      });

      logger.wtf('Milestone Created Successfully');

      _mileStones.add(milestone.copyWith(milestoneId: response.data['data'][0]['id']));
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<void> getMilestones({required String buyerId, required String sellerId, required String listingId}) async {
    List<Milestone> milestonesResponse = [];
    _mileStones.clear();
    const String endpoint = '/milestone/getMileStone';
    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.get, endpoint, queryParameters: {'buyerId': buyerId, 'sellerId': sellerId, 'listingId': listingId});

      logger.w(response.data['data']);

      milestonesResponse = response.data['data'].map<Milestone>((res) => Milestone.fromMap(res)).toList();

      _mileStones.addAll(milestonesResponse);

      logger.wtf('Fetched ALl MIlestone Data Successfully');
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<void> deleteMileStone({required milestoneId}) async {
    const String endpoint = '/milestone/deleteMilestone';

    try {
      // final milestones;
      _mileStones.removeWhere((element) => element.milestoneId == milestoneId);
      // mileStones.addAll(_mileStones);
      // _mileStones.clear();
      await httpClient.request<Map<String, dynamic>>(RequestMethod.delete, endpoint, queryParameters: {'milestoneId': milestoneId});
      // _mileStones.addAll(mileStones);
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<void> markMilestone({required milestoneId}) async {
    const String endpoint = '/milestone/markCompleted';

    try {
      final Milestone selectedMilestone = _mileStones.where((element) => element.milestoneId == milestoneId).first;

      _mileStones.removeWhere((element) => element.milestoneId == milestoneId);

      _mileStones.add(selectedMilestone.copyWith(isCompleted: true));

      await httpClient.request<Map<String, dynamic>>(RequestMethod.put, endpoint, data: {'milestoneId': milestoneId});
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Future<void> updateMilestone({required milestoneId, required milestoneTitle, required DateTime startDate, required DateTime endDate}) async {
    const String endpoint = '/milestone/extendDueDate';

    Map<String, dynamic> milestoneData = {'milestoneId': milestoneId, 'title': milestoneTitle, 'startdate': (startDate.millisecondsSinceEpoch / 1000).round(), 'enddate': (endDate.millisecondsSinceEpoch / 1000).round()};

    try {
      await httpClient.request<Map<String, dynamic>>(RequestMethod.put, endpoint, data: milestoneData);
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  List<Milestone> get mileStones => _mileStones;
}
