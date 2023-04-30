import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/listing_repository/listing_repository.dart';
import '../../../models/listing.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final ListingRepository _listingRepository;

  FavouriteCubit({required ListingRepository listingRepository})
      : _listingRepository = listingRepository,
        super(const FavouriteState());

  Future<void> loadFavListings() async {
    try {
      emit(state.copyWith(favouriteStatus: FavouriteStatus.loading));

      await _listingRepository.getFavouriteListing();

      emit(state.copyWith(favouriteStatus: FavouriteStatus.loaded, favouriteListings: _listingRepository.favouriteListing));
    } catch (_) {
      emit(state.copyWith(favouriteStatus: FavouriteStatus.error));
    }
  }
}
