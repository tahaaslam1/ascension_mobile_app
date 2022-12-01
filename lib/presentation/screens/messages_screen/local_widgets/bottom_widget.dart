import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final void Function(types.PartialText) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
      //  boxShadow: Styles.elevation1,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type something.',
                hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.grey,
                    ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 48,
            width: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16),
            //  boxShadow: Styles.elevation1,
            ),
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () => onPressed(
                const types.PartialText(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tempor id eu nisl nunc mi ipsum faucibus vitae. Augue eget arcu dictum varius duis. Lectus quam id leo in. Vestibulum lectus mauris ultrices eros in cursus turpis.'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
