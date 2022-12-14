// ignore_for_file: overridden_fields, annotate_overrides

part of 'listing_image_cubit.dart';

abstract class ListingImageState extends Equatable {
  final List<XFile> imagesList;
  const ListingImageState({this.imagesList = const []});

  @override
  List<Object> get props => [];
}

class ListingImageInitial extends ListingImageState {}

class ListingImageError extends ListingImageState {
  final String errorMessage;
  const ListingImageError({required this.errorMessage});
}

class ListingImageSelected extends ListingImageState {
  final List<XFile> imagesList;

  const ListingImageSelected({required this.imagesList}) : super(imagesList: imagesList);
}
