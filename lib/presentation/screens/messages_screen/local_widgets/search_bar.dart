import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.surface),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(left: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.surface),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
