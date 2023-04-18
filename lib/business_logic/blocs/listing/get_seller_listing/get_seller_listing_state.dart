part of 'get_seller_listing_bloc.dart';

abstract class GetSellerListingState extends Equatable {
  const GetSellerListingState();

  @override
  List<Object> get props => [];
}

class GetSellerListingInitial extends GetSellerListingState {}

class GetSellerListingLoaded extends GetSellerListingState {
  final List<Listing> sellerListings;

  const GetSellerListingLoaded({required this.sellerListings});
}

class GetSellerListingError extends GetSellerListingState {
  final String errorMessage;

  const GetSellerListingError({required this.errorMessage});
}
