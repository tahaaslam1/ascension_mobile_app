import 'package:ascension_mobile_app/models/selectable.dart';

abstract class SelectableRepository {
  Future<List<Selectable?>> getSelectables(Type selectableType);
  List<Selectable?> filterSelectables(String searchTerm);
  Future<void> addNewSelectable(Selectable newSelectable);
}
