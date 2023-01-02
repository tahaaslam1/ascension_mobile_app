part of 'create_listing_bloc.dart';

abstract class CreateListingEvent extends Equatable {
  const CreateListingEvent();

  @override
  List<Object> get props => [];
}

class CreateListing extends CreateListingEvent {
  final Map<String, dynamic> listingFormData;
  final List<XFile> listingImages;
  final VoidCallback onComplete;
  const CreateListing({required this.listingFormData, required this.listingImages, required this.onComplete});
  @override
  List<Object> get props => [listingFormData, onComplete];
}
