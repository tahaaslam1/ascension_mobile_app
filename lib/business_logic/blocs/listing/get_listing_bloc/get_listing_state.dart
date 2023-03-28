part of 'get_listing_bloc.dart';

enum GetListingStatus { initial, success, failure }

class GetListingState extends Equatable {
  final GetListingStatus status;
  final List<Listing> listings;
  final bool hasReachedMax;

  const GetListingState({
    this.status = GetListingStatus.initial,
    this.listings = const <Listing>[],
    this.hasReachedMax = false,
  });

  GetListingState copyWith({
    GetListingStatus? status,
    List<Listing>? listings,
    bool? hasReachedMax,
  }) {
    return GetListingState(
      status: status ?? this.status,
      listings: listings ?? this.listings,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [status, listings, hasReachedMax];
}

// abstract class GetListingState extends Equatable {
//   const GetListingState();

//   @override
//   List<Object> get props => [];
// }

// class GetListingInitial extends GetListingState {}

// class GetListingLoadingState extends GetListingState {}

// class GetListingLoadedState extends GetListingState {
//   final List<Listing> listings;
//   const GetListingLoadedState({required this.listings});
// }
// class GetListingErrorState extends GetListingState {
//   final String errorMessage;
//   const GetListingErrorState({required this.errorMessage});
// }
