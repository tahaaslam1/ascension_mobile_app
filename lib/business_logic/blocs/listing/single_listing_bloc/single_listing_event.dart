part of 'single_listing_bloc.dart';

abstract class SingleListingEvent extends Equatable {
  const SingleListingEvent();

  @override
  List<Object> get props => [];
}

class FetchSingleListing extends SingleListingEvent {
  final String listingId;

  const FetchSingleListing({required this.listingId});
}

class DeleteSingleListing extends SingleListingEvent {
  final String listingId;

  const DeleteSingleListing({required this.listingId});
}
