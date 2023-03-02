part of 'get_listing_bloc.dart';

abstract class GetListingEvent extends Equatable {
  const GetListingEvent();

  @override
  List<Object> get props => [];
}

class FetchLisiting extends GetListingEvent {
  final int offset;
  const FetchLisiting({required this.offset});
}
