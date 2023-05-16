part of 'milestone_bloc.dart';

enum CreateMileStoneStatus { initial, loading, loaded, error }

class MilestoneState extends Equatable {
  final CreateMileStoneStatus getMileStoneStatus;
  final List<Milestone> milestone;

  const MilestoneState({this.getMileStoneStatus = CreateMileStoneStatus.initial, this.milestone = const <Milestone>[]});

  MilestoneState copyWith({
    CreateMileStoneStatus? getMileStoneStatus,
    List<Milestone>? milestone,
  }) {
    return MilestoneState(getMileStoneStatus: getMileStoneStatus ?? this.getMileStoneStatus, milestone: milestone ?? this.milestone);
  }

  @override
  List<Object> get props => [milestone, getMileStoneStatus];
}
