import 'package:flutter/material.dart';

import '../../../../business_logic/blocs/searching/bloc/searching_bloc.dart';

class SearchBar extends StatefulWidget {
  // final Function(String)? search;
  final searchBloc;
  const SearchBar({
   required this.searchBloc,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}
TextEditingController _controller = new TextEditingController();

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      onChanged:(value){
       widget.searchBloc.add(FetchSearchedListing(listingTitle: value));
      } , 
      controller: _controller,
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
