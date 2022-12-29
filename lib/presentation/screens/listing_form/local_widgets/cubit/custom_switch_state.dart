part of 'custom_switch_cubit.dart';

abstract class CustomSwitchState extends Equatable {
  final bool isAuctioned;
  final bool isEstablished;

  const CustomSwitchState({this.isAuctioned = false, this.isEstablished = false});

  @override
  List<Object> get props => [isAuctioned, isEstablished];
}

class CustomSwitchInitial extends CustomSwitchState {
  const CustomSwitchInitial({bool isAuctioned = false, bool isEstablished = false}) : super(isAuctioned: isAuctioned, isEstablished: isEstablished);
}
