part of 'favourite_cubit.dart';

enum FavouriteStatus { initial, loading, loaded, error }

class FavouriteState extends Equatable {
  final FavouriteStatus favouriteStatus;
  final List<Listing> favouriteListings;
  const FavouriteState({
    this.favouriteStatus = FavouriteStatus.initial,
    this.favouriteListings = const <Listing>[],
  });

  FavouriteState copyWith({
    FavouriteStatus? favouriteStatus,
    List<Listing>? favouriteListings,
  }) {
    return FavouriteState(
      favouriteStatus: favouriteStatus ?? this.favouriteStatus,
      favouriteListings: favouriteListings ?? this.favouriteListings,
    );
  }

  @override
  List<Object> get props => [favouriteListings, favouriteStatus];
}
