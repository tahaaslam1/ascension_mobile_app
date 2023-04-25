part of 'searching_bloc.dart';

abstract class SearchingEvent extends Equatable {
  const SearchingEvent();

  @override
  List<Object> get props => [];
}
class FetchSearchedListing extends SearchingEvent{
  final String listingTitle;
  const FetchSearchedListing({required this.listingTitle});
}
