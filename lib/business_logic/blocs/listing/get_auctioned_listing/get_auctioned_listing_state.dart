part of 'get_auctioned_listing_bloc.dart';

abstract class GetAuctionedListingState extends Equatable {
  const GetAuctionedListingState();

  @override
  List<Object> get props => [];
}

class GetAuctionedListingInitial extends GetAuctionedListingState {}

class GetAuctionedListingLoaded extends GetAuctionedListingState {
  final List<Listing> auctionedListings;

  const GetAuctionedListingLoaded({required this.auctionedListings});
}

class GetAuctionedListingError extends GetAuctionedListingState {
  final String errorMessage;

  const GetAuctionedListingError({required this.errorMessage});
}
