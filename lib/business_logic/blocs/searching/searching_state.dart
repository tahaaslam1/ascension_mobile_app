part of './searching_bloc.dart';

enum GetSearchingStatus { initial, loading, loaded, error }

class SearchingState extends Equatable {
  final GetSearchingStatus getSearchingStatus;
  final List<Listing> listings;

  const SearchingState({
    this.getSearchingStatus = GetSearchingStatus.initial,
    this.listings = const <Listing>[],
  });

  SearchingState copyWith({
    GetSearchingStatus? getSearchingStatus,
    List<Listing>? listings,
  }) {
    return SearchingState(
      getSearchingStatus: getSearchingStatus ?? this.getSearchingStatus,
      listings: listings ?? this.listings,
    );
  }

  @override
  List<Object> get props => [listings, getSearchingStatus];
}
