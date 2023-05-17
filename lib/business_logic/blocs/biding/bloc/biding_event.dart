part of 'biding_bloc.dart';

abstract class BidingEvent extends Equatable {
  const BidingEvent();

  @override
  List<Object> get props => [];
}

class FetchBidsEvent extends BidingEvent {
  final String sellerId;
  const FetchBidsEvent({required this.sellerId});
}

class PlaceBidEvent extends BidingEvent {
  final String buyerId;
  final String sellerId;
  final int bidValue;
  final String listingId;
  final VoidCallback onCompleted;

  const PlaceBidEvent({required this.bidValue, required this.sellerId, required this.buyerId, required this.listingId, required this.onCompleted});
}

class FetchBidDetailsEvent extends BidingEvent {
  final String listingId;
  const FetchBidDetailsEvent({required this.listingId});
}
