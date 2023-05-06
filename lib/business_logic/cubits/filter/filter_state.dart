part of 'filter_cubit.dart';

enum GetFilterStatus {initial,loading, loaded, error}
class FilterState extends Equatable {
  final GetFilterStatus status;
  final List<Selectable?> city;
  final List<Selectable?> industries;

  const FilterState({
    this.city = const <Selectable>[],
    this.status = GetFilterStatus.initial,
    this.industries = const <Selectable>[],
  });

  FilterState copyWith({
    GetFilterStatus? status,
    List<Selectable?>? city,
    List<Selectable?>? industries,
  }) {
    return FilterState(
      status : status ?? this.status,
      city: city ?? this.city,
      industries: industries  ?? this.industries,
    );
  }

  @override
  List<Object> get props => [city, industries,status];
}
