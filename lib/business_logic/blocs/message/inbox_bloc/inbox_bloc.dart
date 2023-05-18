import 'package:ascension_mobile_app/data/repositories/chat_repository/chat_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../models/inbox.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final UserRepository _userRepository;
  final ChatRepository _chatRepository;
  InboxBloc({
    required UserRepository userRepository,
    required ChatRepository chatRepository,
  })  : _userRepository = userRepository,
        _chatRepository = chatRepository,
        super(InboxInitial()) {
    on<FetchInboxes>(_onFetchInboxes);
    on<BuyerCreateInbox>((event, emit) async {
      try {
        User? user = _userRepository.getLoggedInUser;
        logger.d('buyer id');
        logger.d(user?.userId);

        final result = await _chatRepository.createInbox(buyerId: user?.userId, sellerId: event.sellerId, title: event.title, listingId: event.listingId);

        event.inboxCreate(result['first_name'], result['last_name']);
      } on Failure3 catch (e) {
        event.inboxExits(e.data['first_name'], e.data['last_name']);
      } on Failure catch (e) {
        logger.e(e);
        event.onError();
      }
    });
    on<SellerCreateInbox>((event, emit) async {
      try {
        User? user = _userRepository.getLoggedInUser;
        final result = await _chatRepository.createInbox(buyerId: event.buyerId, sellerId: user!.userId, title: event.title, listingId: event.listingId);

        event.inboxCreate(result['first_name'], result['last_name']);
      } on Failure3 catch (e) {
        event.inboxExits(e.data['first_name'], e.data['last_name']);
      } on Failure catch (e) {
        event.onError();
      }
    });
  }
  void _onFetchInboxes(FetchInboxes event, Emitter<InboxState> emit) async {
    emit(InboxLoadingState());

    try {
      User? user = _userRepository.getLoggedInUser;

      List<Inbox> inboxes = await _chatRepository.getInboxes(userId: user?.userId);

      emit(InboxLoadedState(inboxs: inboxes));
    } on Failure catch (e) {
      logger.e(e);
      emit(InboxErrorState(errorMessage: e.message));
    }
  }
}
