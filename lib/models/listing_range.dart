import 'package:equatable/equatable.dart';

class ListingRange extends Equatable {
  final int min;
  final int max;
  const ListingRange({required this.min, required this.max});

  @override
  List<Object?> get props => [min, max];
}
