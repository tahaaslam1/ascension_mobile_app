part of 'edit_listing_bloc.dart';

enum UpdateListingStatus { initial, loading, loaded, error }

class EditListingState extends Equatable {
  final Listing listing;
  final UpdateListingStatus updateListingStatus;

  const EditListingState({
    required this.listing,
    this.updateListingStatus = UpdateListingStatus.initial,
  });

  EditListingState copyWith({
    Listing? listing,
    UpdateListingStatus? updateListingStatus,
  }) {
    return EditListingState(
      listing: listing ?? this.listing,
      updateListingStatus: updateListingStatus ?? this.updateListingStatus,
    );
  }

  @override
  List<Object> get props => [listing, updateListingStatus];
}
