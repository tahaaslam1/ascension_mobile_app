import 'package:ascension_mobile_app/data/repositories/milestone_repository/milestone_repository.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ascension_mobile_app/models/milestone.dart';
import 'package:flutter/material.dart';

import '../../../logger.dart';

part 'milestone_event.dart';
part 'milestone_state.dart';

class MilestoneBloc extends Bloc<MilestoneEvent, MilestoneState> {
  final MileStoneRepository _mileStoneRepository;
  MilestoneBloc({required MileStoneRepository mileStoneRepository})
      : _mileStoneRepository = mileStoneRepository,
        super(const MilestoneState()) {
    on<CreateMilestoneEvent>((event, emit) async {
      try {
        emit(state.copyWith(createMileStoneStatus: CreateMileStoneStatus.creating));

        await _mileStoneRepository.createNewMilestone(milestone: event.mileStone);
        emit(state.copyWith(createMileStoneStatus: CreateMileStoneStatus.created));
        emit(state.copyWith(milestones: _mileStoneRepository.mileStones));
        event.onCompleted();
      } on Failure catch (_) {
        event.onError();
      }
    });

    on<FetchMilestones>((event, emit) async {
      try {
        emit(state.copyWith(getMileStoneStatus: GetMileStoneStatus.loading));
        await _mileStoneRepository.getMilestones(buyerId: event.buyerId, sellerId: event.sellerId, listingId: event.listingId);
        emit(state.copyWith(milestones: _mileStoneRepository.mileStones, getMileStoneStatus: GetMileStoneStatus.loaded));
      } on Failure catch (_) {
        emit(state.copyWith(getMileStoneStatus: GetMileStoneStatus.error));
      }
    });
    on<DeleteMilestone>((event, emit) async {
      try {
        emit(state.copyWith(deleteMileStoneStatus: DeleteMileStoneStatus.deleting));
        await _mileStoneRepository.deleteMileStone(milestoneId: event.milestoneId);
        emit(state.copyWith(milestones: _mileStoneRepository.mileStones, getMileStoneStatus: GetMileStoneStatus.loaded));
        event.onComplete();
      } on Failure catch (_) {
        event.onError();
      }
    });
    on<MarkMilestone>((event, emit) async {
      try {
        // emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loading));
        await _mileStoneRepository.markMilestone(milestoneId: event.milestoneId);
        event.onComplete();
        emit(state.copyWith(milestones: _mileStoneRepository.mileStones, getMileStoneStatus: GetMileStoneStatus.loaded));
      } on Failure catch (_) {
        logger.e(_);
        event.onError();
        // emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.error));
      }
    });
    on<UpdateMilestone>((event, emit) async {
      try {
        // emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loading));
        await _mileStoneRepository.updateMilestone(milestoneId: event.milestoneId, milestoneTitle: event.milestoneTitle, startDate: event.startDate, endDate: event.endDate);
        event.onComplete();
        // emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.loaded));
      } on Failure catch (_) {
        // logger.e(_);
        event.onError();
        // emit(state.copyWith(getMileStoneStatus: CreateMileStoneStatus.error));
      }
    });
  }
}
