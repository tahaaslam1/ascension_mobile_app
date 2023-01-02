import 'package:flutter/material.dart';

class SearchBarFormList extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController textEditingController;
  const SearchBarFormList({Key? key, required this.onChanged, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: TextFormField(
        onChanged: onChanged,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          suffixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
