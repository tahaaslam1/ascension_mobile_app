import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_listing_event.dart';
part 'get_listing_state.dart';

class GetListingBloc extends Bloc<GetListingEvent, GetListingState> {
  GetListingBloc() : super(GetListingInitial()) {
    on<GetListingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
