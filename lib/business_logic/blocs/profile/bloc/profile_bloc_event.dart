part of 'profile_bloc_bloc.dart';

class ProfileBlocEvent extends Equatable {
  const ProfileBlocEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileEvent extends ProfileBlocEvent {
  final String firstName;
  final String lastName;
  final XFile? profile_image;
  final String email;
  final String? oldImage;
   final VoidCallback onCompleted;
  // final int userType;
  final String userId;
  const UpdateProfileEvent({
    required this.firstName,
    required this.lastName,
    this.profile_image,
    required this.userId,
    required this.email,
    required this.onCompleted,
    this.oldImage,
  });
}
