import 'package:ascension_mobile_app/data/repositories/chat_repository/chat_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/networking/client/http_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

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


  }
  void _onFetchInboxes(FetchInboxes event, Emitter<InboxState> emit) async {
    emit(InboxLoadingState());

    try {
      User? user = _userRepository.getLoggedInUser;

      List<Inbox> inboxes = await _chatRepository.getInboxes(userId: user?.userId);

      emit(InboxLoadedState(inboxs: inboxes));
    } on DioError catch (e) {
      logger.e(e);
      emit(InboxErrorState(errorMessage: DioExceptions.fromDioError(e).toString()));
    }
  }
}
