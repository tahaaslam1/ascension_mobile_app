part of 'selectable_bloc.dart';

abstract class SelectableState extends Equatable {
  const SelectableState();

  @override
  List<Object> get props => [];
}

class SelectableInitialState extends SelectableState {}

class SelectableLoadedState extends SelectableState {
  final List<Selectable?> selectables;
  const SelectableLoadedState({required this.selectables});
}

class SelectableLoadingState extends SelectableState {}

class SelectableErrorState extends SelectableState {
  final String errorMessage;
  const SelectableErrorState({required this.errorMessage});
}
