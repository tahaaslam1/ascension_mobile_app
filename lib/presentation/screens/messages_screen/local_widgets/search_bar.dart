import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.surface),
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: Colors.white,
        focusColor: Theme.of(context).colorScheme.primary,
        suffixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
