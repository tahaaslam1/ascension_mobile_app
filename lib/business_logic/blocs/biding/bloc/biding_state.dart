part of 'biding_bloc.dart';

enum GetBidingStatus { initial, loading, loaded, error }

class BidingState extends Equatable {
  final GetBidingStatus status;
  final Bids bid;
  final List<Bids> bidLists;

  const BidingState({
    this.status = GetBidingStatus.initial,
    this.bid = Bids.empty,
    this.bidLists = const <Bids>[],
  });

  BidingState copyWith({
    GetBidingStatus? status,
    Bids? bid,
    List<Bids>? bidLists,
  }) {
    return BidingState(
      status: status ?? this.status,
      bid: bid ?? this.bid,
      bidLists: bidLists ?? this.bidLists,
    );
  }

  @override
  List<Object> get props => [status, bid, bidLists];
}
