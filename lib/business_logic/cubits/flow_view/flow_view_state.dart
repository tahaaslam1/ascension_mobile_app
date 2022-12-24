part of 'flow_view_cubit.dart';

class FlowViewState extends Equatable {
  final int currentStep;
  final int totalSteps;
  final bool isLoading;
  const FlowViewState({required this.currentStep, required this.totalSteps, required this.isLoading});
  @override
  List<Object> get props => [currentStep, totalSteps, isLoading];
  FlowViewState copyWith({int? currentStep, int? totalSteps, bool? isLoading}) {
    return FlowViewState(currentStep: currentStep ?? this.currentStep, totalSteps: totalSteps ?? this.totalSteps, isLoading: isLoading ?? this.isLoading);
  }
}

