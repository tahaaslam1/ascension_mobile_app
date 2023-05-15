part of 'filter_cubit.dart';

enum FilterStatus { initial, loading, loaded, error }

class FilterState extends Equatable {
  final FilterStatus status;
  final City city;
  final List<Industry2> industries;
  final int priceRangeStart;
  final int priceRangeEnd;
  final bool isAuctioned;
  final bool isEstablished;

  const FilterState({
    this.city = City.empty,
    this.status = FilterStatus.initial,
    this.industries = const <Industry2>[],
    this.priceRangeStart = 0,
    this.priceRangeEnd = 0,
    this.isAuctioned = false,
    this.isEstablished = false,
  });

  FilterState copyWith({
    FilterStatus? status,
    City? city,
    List<Industry2>? industries,
    int? priceRangeStart,
    int? priceRangeEnd,
    bool? isAuctioned,
    bool? isEstablished,
  }) {
    return FilterState(
      status: status ?? this.status,
      city: city ?? this.city,
      industries: industries ?? this.industries,
      priceRangeStart: priceRangeStart ?? this.priceRangeStart,
      priceRangeEnd: priceRangeEnd ?? this.priceRangeEnd,
      isAuctioned: isAuctioned ?? this.isAuctioned,
      isEstablished: isEstablished ?? this.isEstablished,
    );
  }

  @override
  List<Object> get props => [city, industries, status, priceRangeStart, priceRangeEnd, isAuctioned, isEstablished];
}
