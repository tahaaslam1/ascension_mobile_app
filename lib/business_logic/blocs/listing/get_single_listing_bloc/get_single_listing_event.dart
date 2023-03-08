part of 'get_single_listing_bloc.dart';

abstract class GetSingleListingEvent extends Equatable {
  const GetSingleListingEvent();

  @override
  List<Object> get props => [];
}

class FetchSingleListing extends GetSingleListingEvent {
  final String listingId;

  const FetchSingleListing({required this.listingId});
}

