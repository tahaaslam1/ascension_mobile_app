part of 'profile_bloc_bloc.dart';

enum ProfileStatus { initial, loading, loaded, error }

class ProfileBlocState extends Equatable {
  final ProfileStatus status;
  const ProfileBlocState({
    this.status = ProfileStatus.initial,
  });
  ProfileBlocState copyWith({
    ProfileStatus? status,
  }) {
    return ProfileBlocState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}

class ProfileBlocInitial extends ProfileBlocState {}
