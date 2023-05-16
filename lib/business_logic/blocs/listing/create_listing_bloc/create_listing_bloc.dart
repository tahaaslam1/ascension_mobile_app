import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

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

        await _listingRepository.createListing(listingFormData: event.listingFormData, listingImages: event.listingImages, sellerId: user!.userId);

        event.onComplete();
      } on Failure catch (e) {
        logger.e(e);
        emit(CreateListingFormError(errorMessage: e.message));
      }
    }));
  }
}
