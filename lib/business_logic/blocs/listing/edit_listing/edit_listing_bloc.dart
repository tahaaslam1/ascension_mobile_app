import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/listing.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../services/http/failure.dart';

part 'edit_listing_event.dart';
part 'edit_listing_state.dart';

class EditListingBloc extends Bloc<EditListingEvent, EditListingState> {
  final ListingRepository _listingRepository;
  final Listing _listing;

  EditListingBloc({required ListingRepository listingRepository, required Listing listing})
      : _listingRepository = listingRepository,
        _listing = listing,
        super(EditListingState(listing: listing)) {
    on<UpdateIsAuctioned>((event, emit) {
      emit(state.copyWith(listing: _listing.copyWith(isAuctioned: event.isAuctioned, isEstablished: state.listing.isEstablished)));
    });
    on<UpdateIsEstablished>((event, emit) {
      emit(state.copyWith(listing: _listing.copyWith(isEstablished: event.isEstablished, isAuctioned: state.listing.isAuctioned)));
    });

    on<UpdateListing>((event, emit) async {
      try {
        await _listingRepository.updateListing(listingId: _listing.listingId, data: event.editFormData);
        event.onComplete();
        logger.wtf('Listing updated successfully');
      } on Failure catch (_) {
        event.onError();
        emit(state.copyWith(updateListingStatus: UpdateListingStatus.error));
      }
    });
  }
}
