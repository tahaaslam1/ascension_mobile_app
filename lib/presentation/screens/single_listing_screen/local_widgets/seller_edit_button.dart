import 'package:flutter/material.dart';

class SellerEditButton extends StatelessWidget {
  const SellerEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Center(
        child: Icon(Icons.edit),
      ),
      onPressed: () {
        
      },
    );
  }
}
