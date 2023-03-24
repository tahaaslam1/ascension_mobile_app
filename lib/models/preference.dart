import 'package:ascension_mobile_app/models/listing_range.dart';
import 'package:ascension_mobile_app/models/selectable.dart';
import 'package:equatable/equatable.dart';

class Preferrence extends Equatable {
  final WorkplaceType workplaceType;
  final List<City> city;
  final List<Industry> industries;
  final ListingRange listingRange;

  const Preferrence({
    required this.workplaceType,
    required this.city,
    required this.industries,
    required this.listingRange,
  });

  @override
  List<Object?> get props => [workplaceType, city, industries, listingRange];
}
