part of 'get_recommended_listing_bloc.dart';

abstract class GetRecommendedListingState extends Equatable {
  const GetRecommendedListingState();

  @override
  List<Object> get props => [];
}

class GetRecommendedListingInitial extends GetRecommendedListingState {}

class GetRecommendedListingLoading extends GetRecommendedListingState {}

class GetRecommendedListingLoaded extends GetRecommendedListingState {
  final List<Listing> listings;

  const GetRecommendedListingLoaded({required this.listings});
}

class GetRecommendedListingError extends GetRecommendedListingState {
  final String errorMessage;

  const GetRecommendedListingError({required this.errorMessage});
}
