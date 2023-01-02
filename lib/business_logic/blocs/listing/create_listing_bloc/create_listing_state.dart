part of 'create_listing_bloc.dart';

abstract class CreateListingState extends Equatable {
  const CreateListingState();

  @override
  List<Object> get props => [];
}

class CreateListingFormInitial extends CreateListingState {}

class CreateListingFormLoading extends CreateListingState {}

class CreateListingFormError extends CreateListingState {
  final String errorMessage;

  const CreateListingFormError({required this.errorMessage});
}
