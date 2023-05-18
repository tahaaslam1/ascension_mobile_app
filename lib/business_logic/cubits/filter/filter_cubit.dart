import 'package:ascension_mobile_app/business_logic/blocs/searching/searching_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/selectable.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  // final SearchingBloc _searchingBloc;
  FilterCubit()
      :
        // : _searchingBloc = searchingBloc,
        super(const FilterState());

  void updateFilter({required bool isAuctioned, required bool isEstablished, required int priceRangeStart, required int priceRangeEnd, required List<Industry2> industries, required City city}) {
    emit(state.copyWith(
      isAuctioned: isAuctioned,
      isEstablished: isEstablished,
      priceRangeStart: priceRangeStart,
      priceRangeEnd: priceRangeEnd,
      industries: industries,
      city: city,
    ));
  }

  void updateIsAuctioned({required bool isAunctioned}) {
    emit(state.copyWith(isAuctioned: isAunctioned));
  }

  void updateIsEstablished({required bool isEstablished}) {
    emit(state.copyWith(isEstablished: isEstablished));
  }

  void addIndustry(newIndustry) {
    List<Industry2> industries = List<Industry2>.of(state.industries);

    if (!industries.contains(newIndustry)) {
      industries.add(newIndustry);
    }
    emit(state.copyWith(industries: industries));
  }

  void deleteIndustry(toBeDeletedIndustry) {
    List<Industry2> industries = List<Industry2>.of(state.industries);
    industries.removeWhere((industry) => industry == toBeDeletedIndustry);
    emit(state.copyWith(industries: industries));
  }
}
