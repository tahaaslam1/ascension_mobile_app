import 'package:ascension_mobile_app/data/repositories/selectable_repository/node_selectable_repository.dart';
import 'package:ascension_mobile_app/data/repositories/selectable_repository/selectable_repository.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:ascension_mobile_app/services/app_message_service.dart';
import 'package:ascension_mobile_app/services/http/http_services.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'selectable_event.dart';
part 'selectable_state.dart';

class SelectableBloc extends Bloc<SelectableEvent, SelectableState> {
  SelectableBloc() : super(SelectableInitialState()) {
    final SelectableRepository selectableRepository = NodeSelectableRepository(httpClient: HttpService());
    on<FetchSelectables>((event, emit) async {
      emit(SelectableLoadingState());
      try {
        final List<Selectable?> response = await selectableRepository.getSelectables(event.selectableType);
        emit(SelectableLoadedState(selectables: response));
      } on DioError {
        emit(const SelectableErrorState(errorMessage: AppMessageService.genericErrorMessage));
      }
    });
    on<AddSelectable>((event, emit) async {
      emit(SelectableLoadingState());
      try {
        // await selectableRepository.addNewSelectable(event.selectable);
        //  emit(SelectableLoadedState(selectables: [event.selectable]));
      } on Exception {
        emit(const SelectableErrorState(errorMessage: AppMessageService.genericErrorMessage));
      }
    });
    on<FilterSelectable>((event, emit) {
      emit(SelectableLoadingState());
      try {
        // final List<Selectable?> response = selectableRepository.filterSelectables(event.searchTerm);
        //  emit(SelectableLoadedState(selectables: response));
      } on Exception {
        emit(const SelectableErrorState(errorMessage: AppMessageService.genericErrorMessage));
      }
    });
  }
}
