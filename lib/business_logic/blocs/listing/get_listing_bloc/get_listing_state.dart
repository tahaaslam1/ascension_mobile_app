part of 'get_listing_bloc.dart';

abstract class GetListingState extends Equatable {
  const GetListingState();

  @override
  List<Object> get props => [];
}

class GetListingInitial extends GetListingState {}

class GetListingLoadingState extends GetListingState {}

class GetListingLoadedState extends GetListingState {
  final List<Listing> listings;
  const GetListingLoadedState({required this.listings});
}
class GetListingErrorState extends GetListingState {
  final String errorMessage;
  const GetListingErrorState({required this.errorMessage});
}
