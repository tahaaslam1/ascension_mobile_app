import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'listing_switch_state.dart';

class ListingSwitchCubit extends Cubit<ListingSwitchState> {
  ListingSwitchCubit() : super(const ListingSwitchInitial());

  void updateIsAuctioned({required bool isAunctioned}) {
    emit(ListingSwitchInitial(isAuctioned: isAunctioned, isEstablished: state.isEstablished));
  }

  void updateIsEstablished({required bool isEstablished}) {
    emit(ListingSwitchInitial(isAuctioned: state.isAuctioned, isEstablished: isEstablished));
  }
}
