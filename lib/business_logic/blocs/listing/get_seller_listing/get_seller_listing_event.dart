part of 'get_seller_listing_bloc.dart';

abstract class GetSellerListingEvent extends Equatable {
  const GetSellerListingEvent();

  @override
  List<Object> get props => [];
}

class FetchSellerListing extends GetSellerListingEvent {}
