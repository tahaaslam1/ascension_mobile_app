part of 'selectable_bloc.dart';

abstract class SelectableEvent extends Equatable {
  const SelectableEvent();

  @override
  List<Object> get props => [];
}

class FetchSelectables extends SelectableEvent {
  final Type selectableType;
  const FetchSelectables({required this.selectableType});
}

class AddSelectable extends SelectableEvent {
  final Selectable selectable;
  const AddSelectable({required this.selectable});
}

class FilterSelectable extends SelectableEvent {
  final String searchTerm;
  const FilterSelectable({required this.searchTerm});
}
