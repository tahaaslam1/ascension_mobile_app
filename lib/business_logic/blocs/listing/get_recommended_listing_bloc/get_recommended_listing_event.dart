part of 'get_recommended_listing_bloc.dart';

abstract class GetRecommendedListingEvent extends Equatable {
  const GetRecommendedListingEvent();

  @override
  List<Object> get props => [];
}

class FetchSingleRecommendedListing extends GetRecommendedListingEvent {
  final String? industry;

  const FetchSingleRecommendedListing({required this.industry});
}
