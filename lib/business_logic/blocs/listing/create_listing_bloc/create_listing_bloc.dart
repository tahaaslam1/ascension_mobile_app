import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/networking/client/http_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';

part 'create_listing_event.dart';
part 'create_listing_state.dart';

class CreateListingBloc extends Bloc<CreateListingEvent, CreateListingState> {
  final UserRepository _userRepository;
  final ListingRepository _listingRepository;

  CreateListingBloc({required UserRepository userRepository, required ListingRepository listingRepository})
      : _userRepository = userRepository,
        _listingRepository = listingRepository,
        super(CreateListingFormInitial()) {
    on<CreateListing>(((event, emit) async {
      emit(CreateListingFormLoading());

      try {
        User? user = _userRepository.getLoggedInUser;

        await _listingRepository.createListing(listingFormData: event.listingFormData, sellerId: user!.userId);

        event.onComplete();
      } on DioError catch (e) {
        logger.e(e);
        emit(CreateListingFormError(errorMessage: DioExceptions.fromDioError(e).toString()));
      }
    }));
  }
}
