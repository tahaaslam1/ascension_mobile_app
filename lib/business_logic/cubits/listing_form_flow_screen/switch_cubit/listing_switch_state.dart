part of 'listing_switch_cubit.dart';

abstract class ListingSwitchState extends Equatable {
  final bool isAuctioned;
  final bool isEstablished;

  const ListingSwitchState({this.isAuctioned = false, this.isEstablished = false});

  @override
  List<Object> get props => [isAuctioned, isEstablished];
}

class ListingSwitchInitial extends ListingSwitchState {
  const ListingSwitchInitial({bool isAuctioned = false, bool isEstablished = false}) : super(isAuctioned: isAuctioned, isEstablished: isEstablished);
}
