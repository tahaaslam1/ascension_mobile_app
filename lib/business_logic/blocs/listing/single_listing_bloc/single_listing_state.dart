part of 'single_listing_bloc.dart';

enum GetSingleListingStatus { initial, loading, loaded, error }

enum DeleteSingleListingStatus { initial, loading, deleted, error }

class SingleListingState extends Equatable {
  final GetSingleListingStatus getSingleListingStatus;
  final DeleteSingleListingStatus deleteSingleListingStatus;
  final Listing listing;
  final bool isFav;
  const SingleListingState({
    this.deleteSingleListingStatus = DeleteSingleListingStatus.initial,
    this.getSingleListingStatus = GetSingleListingStatus.initial,
    this.listing = Listing.empty,
    this.isFav = false,
  });

  SingleListingState copyWith({
    GetSingleListingStatus? getSingleListingStatus,
    Listing? listing,
    DeleteSingleListingStatus? deleteSingleListingStatus,
    isFav,
  }) {
    return SingleListingState(
      getSingleListingStatus: getSingleListingStatus ?? this.getSingleListingStatus,
      listing: listing ?? this.listing,
      deleteSingleListingStatus: deleteSingleListingStatus ?? this.deleteSingleListingStatus,
      isFav: isFav ?? this.isFav,
    );
  }

  @override
  List<Object> get props => [listing, getSingleListingStatus, deleteSingleListingStatus , isFav];
}

// class SingleListingInitial extends SingleListingState {}

// class SingleListingLoading extends SingleListingState {}

// class SingleListingLoaded extends SingleListingState {
//   final Listing listing;

//   const SingleListingLoaded({required this.listing});
// }

// class SingleListingError extends SingleListingState {
//   final String errorMessage;

//   const SingleListingError({required this.errorMessage});
// }
