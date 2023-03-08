part of 'get_single_listing_bloc.dart';

abstract class GetSingleListingState extends Equatable {
  const GetSingleListingState();

  @override
  List<Object> get props => [];
}

class GetSingleListingInitial extends GetSingleListingState {}

class GetSingleListingLoading extends GetSingleListingState {}

class GetSingleListingLoaded extends GetSingleListingState {
  final Listing listing;

  const GetSingleListingLoaded({required this.listing});
}

class GetSingleListingError extends GetSingleListingState {
  final String errorMessage;

  const GetSingleListingError({required this.errorMessage});
}


