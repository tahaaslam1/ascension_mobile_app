part of 'searching_bloc.dart';

abstract class SearchingEvent extends Equatable {
  const SearchingEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchedListing extends SearchingEvent {
  final String listingTitle;
  final List<Industry2>? industries;
  final int? priceRangeStart;
  final City? city;
  final int? priceRangeEnd;
  final bool? isAuctioned;
  final bool? isEstablished;
  const FetchSearchedListing({
    this.industries,
    this.priceRangeStart,
    this.city,
    this.priceRangeEnd,
    this.isAuctioned,
    this.isEstablished,
    required this.listingTitle,
  });
}
