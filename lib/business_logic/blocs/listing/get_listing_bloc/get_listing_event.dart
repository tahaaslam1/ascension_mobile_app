part of 'get_listing_bloc.dart';

abstract class GetListingEvent extends Equatable {
  const GetListingEvent();

  @override
  List<Object> get props => [];
}

class ListingFetched extends GetListingEvent {}
