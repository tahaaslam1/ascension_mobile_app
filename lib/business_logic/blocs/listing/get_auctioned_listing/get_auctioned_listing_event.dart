part of 'get_auctioned_listing_bloc.dart';

abstract class GetAuctionedListingEvent extends Equatable {
  const GetAuctionedListingEvent();

  @override
  List<Object> get props => [];
}

class FetchAuctionedListing extends GetAuctionedListingEvent {}
