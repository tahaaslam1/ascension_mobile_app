import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/repositories/listing_repository/listing_repository.dart';
import '../../../../models/bids.dart';
import '../../../../services/http/failure.dart';

part 'biding_event.dart';
part 'biding_state.dart';

class BidingBloc extends Bloc<BidingEvent, BidingState> {
  final ListingRepository _listingRepository;
  BidingBloc({required ListingRepository listingRepository})
      : _listingRepository = listingRepository,
        super(BidingState()) {
    on<PlaceBidEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: GetBidingStatus.loading));
        await _listingRepository.placeBid(buyerId: event.buyerId, sellerId: event.sellerId, bidValue: event.bidValue, listingId: event.listingId);
        event.onCompleted();
        emit(state.copyWith(status: GetBidingStatus.loaded));
      } on Failure catch (_) {
        emit(state.copyWith(status: GetBidingStatus.error));
      }
    });
    on<FetchBidDetailsEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: GetBidingStatus.loading));
        Bids bid = await _listingRepository.getBidDetail(listingId: event.listingId);

        emit(state.copyWith(status: GetBidingStatus.loaded, bid: bid));
      } on Failure catch (_) {
        emit(state.copyWith(status: GetBidingStatus.error));
      }
    });
    on<FetchBidsEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: GetBidingStatus.loading));
        List<Bids> bids = await _listingRepository.fetchAllBids(sellerId: event.sellerId);
        emit(state.copyWith(status: GetBidingStatus.loaded, bidLists: bids));
      } on Failure catch (_) {
        emit(state.copyWith(status: GetBidingStatus.error));
      }
    });
  }
}
