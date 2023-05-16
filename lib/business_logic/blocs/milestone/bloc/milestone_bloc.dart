import 'package:ascension_mobile_app/data/repositories/milestone_repository/milestone_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ascension_mobile_app/models/milestone.dart';
import 'package:flutter/material.dart';

import '../../../../logger.dart';

part 'milestone_event.dart';
part 'milestone_state.dart';

class MilestoneBloc extends Bloc<MilestoneEvent, MilestoneState> {
  final MileStoneRepository _mileStoneRepository;
  MilestoneBloc({required MileStoneRepository mileStoneRepository})
      : _mileStoneRepository = mileStoneRepository,
        super(const MilestoneState()) {
    on<CreateMilestoneEvent>((event, emit) async {
      try {
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loading));
        await _mileStoneRepository.createNewMilestone(milestoneTitle: event.mileStoneTitle, buyerId: event.buyerId, startDate: event.startDate, endDate: event.endDate, sellerId: event.sellerId, buyerName: event.buyerName, listingId: event.listingId);
        event.onCompleted();
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loaded));
      } on DioError catch (_) {
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.error));
      }
    });
    on<FetchMilestones>((event, emit) async {
      try {
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loading));
        List<Milestone> milestone = await _mileStoneRepository.getMilestones(buyerId: event.buyerId, sellerId: event.sellerId, listingId: event.listingId);
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loaded, milestone: milestone));
      } on DioError catch (_) {
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.error));
      }
    });
    on<DeleteMilestone>((event, emit) async {
      try {
        logger.d("here");
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loading));
        final deleteMilestone = await _mileStoneRepository.deleteMileStone(milestoneId: event.milestoneId);
        event.onComplete();
        // emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loaded));
      } on DioError catch (_) {
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.error));
      }
    });
    on<MarkMilestone>((event, emit) async {
      try {
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loading));
        final markMilestone = await _mileStoneRepository.markMilestone(milestoneId: event.milestoneId);
        event.onComplete();
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loaded));
      } catch (_) {
        logger.e(_);

        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.error));
      }
    });
    on<UpdateMilestone>((event, emit) async {
      try {
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loading));
        await _mileStoneRepository.updateMilestone(milestoneId: event.milestoneId, milestoneTitle: event.milestoneTitle, startDate: event.startDate, endDate: event.endDate);
        event.onComplete();
        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loaded));
      } catch (_) {
        // logger.e(_);

        emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.error));
      }
    });
  }
}
