part of 'milestone_bloc.dart';

enum GetMileStoneStatus { initial, loading, loaded, error }

enum CreateMileStoneStatus { intial, creating, created }

enum DeleteMileStoneStatus { intial, deleting, deleted }

class MilestoneState extends Equatable {
  final GetMileStoneStatus getMileStoneStatus;
  final List<Milestone> milestones;
  final CreateMileStoneStatus createMileStoneStatus;
  final DeleteMileStoneStatus deleteMileStoneStatus;

  const MilestoneState({
    this.getMileStoneStatus = GetMileStoneStatus.initial,
    this.createMileStoneStatus = CreateMileStoneStatus.intial,
    this.deleteMileStoneStatus = DeleteMileStoneStatus.intial,
    this.milestones = const <Milestone>[],
  });

  MilestoneState copyWith({
    GetMileStoneStatus? getMileStoneStatus,
    List<Milestone>? milestones,
    CreateMileStoneStatus? createMileStoneStatus,
    DeleteMileStoneStatus? deleteMileStoneStatus,
  }) {
    return MilestoneState(
      milestones: milestones ?? this.milestones,
      getMileStoneStatus: getMileStoneStatus ?? this.getMileStoneStatus,
      createMileStoneStatus: createMileStoneStatus ?? this.createMileStoneStatus,
      deleteMileStoneStatus: deleteMileStoneStatus ?? this.deleteMileStoneStatus,
    );
  }

  @override
  List<Object> get props => [milestones, getMileStoneStatus, createMileStoneStatus, deleteMileStoneStatus];
}
