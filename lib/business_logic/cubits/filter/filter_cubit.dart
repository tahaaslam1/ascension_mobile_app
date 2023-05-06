import 'package:ascension_mobile_app/business_logic/blocs/selectable/selectable_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/selectable_repository/node_selectable_repository.dart';
import '../../../data/repositories/selectable_repository/selectable_repository.dart';
import '../../../logger.dart';
import '../../../models/selectable.dart';
import '../../../networking/client/http_client.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
 SelectableRepository _selectableRepository = NodeSelectableRepository(httpClient: HTTPClient(Dio()));



  FilterCubit({required SelectableRepository selectableRepository})
      : _selectableRepository = selectableRepository,
      super(const FilterState());

  Future<void> loadSelectables() async {

    try{
      emit(state.copyWith(status: GetFilterStatus.loading));
      final List<Selectable?> cities = await _selectableRepository.getSelectables(City); 
      final List<Selectable?> industries = await _selectableRepository.getSelectables(Industry);
      logger.d(cities, industries);
      emit(state.copyWith(status: GetFilterStatus.loaded, city: cities, industries: industries));
    }on DioError catch (_) {
        emit(state.copyWith(status: GetFilterStatus.error));
      }
    
    
   // _selectableBloc.add(co?nst FetchSelectables(selectableType: City));


 //   _selectableBloc.add(const FetchSelectables(selectableType: Industry));

    // _selectableBloc.state
    // emit with state.copywith()
  }
}
