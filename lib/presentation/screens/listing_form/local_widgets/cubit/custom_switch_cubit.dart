import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'custom_switch_state.dart';

class CustomSwitchCubit extends Cubit<CustomSwitchState> {
  CustomSwitchCubit() : super(const CustomSwitchInitial());

  void updateIsAuctioned({required bool isAunctioned}) {
    emit(CustomSwitchInitial(isAuctioned: isAunctioned, isEstablished: state.isEstablished));
  }

  void updateIsEstablished({required bool isEstablished}) {
    emit(CustomSwitchInitial(isAuctioned: state.isAuctioned, isEstablished: isEstablished));
  }
}
