import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/repositories/user_repository/user_repository.dart';

part 'profile_bloc_event.dart';
part 'profile_bloc_state.dart';

class ProfileBlocBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  final UserRepository _userRepository;
  ProfileBlocBloc({required UserRepository UserRepository})
      : _userRepository = UserRepository,
        super(ProfileBlocInitial()) {
    on<UpdateProfileEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: ProfileStatus.loading));
        await _userRepository.updateProfile(
          firstName: event.firstName,
          lastName: event.lastName,
          profileUrl: event.profile_image,
          userId: event.userId,
          email: event.email,
          oldImage: event.oldImage,
        );
        event.onCompleted();
        emit(state.copyWith(status: ProfileStatus.loaded));
      } on Failure catch (_) {
        emit(state.copyWith(status: ProfileStatus.error));
      }
    });
  }
}
