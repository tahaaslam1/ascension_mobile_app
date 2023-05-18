part of 'edit_listing_bloc.dart';

abstract class EditListingEvent extends Equatable {
  const EditListingEvent();

  @override
  List<Object> get props => [];
}

class UpdateIsAuctioned extends EditListingEvent {
  final bool isAuctioned;

  const UpdateIsAuctioned({required this.isAuctioned});
}

class UpdateIsEstablished extends EditListingEvent {
  final bool isEstablished;

  const UpdateIsEstablished({required this.isEstablished});
}

// class UpdateListing extends EditListingEvent {}

class UpdateListing extends EditListingEvent {
  final Map<String, dynamic> editFormData;
  final VoidCallback onComplete;
  final VoidCallback onError;

  const UpdateListing({required this.onComplete, required this.editFormData, required this.onError});
}
