
import 'package:flutter/material.dart';

class CustomAppBarAndBody extends StatelessWidget {
  final Widget body;
  final String title;
  final bool showBackButton;
  final VoidCallback? onBack;

  const CustomAppBarAndBody({
    Key? key,
    required this.body,
    required this.title,
    required this.showBackButton,
    this.onBack,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (!showBackButton) {
      return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            snap: true,
            elevation: 0.0,
            title: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            automaticallyImplyLeading: false,
          ),
        ],
        body: body,
      );
    } else {
      return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            snap: true,
            elevation: 0.0,
            title: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5?.copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            leading: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 20.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 24,
                ),
                onPressed: onBack ?? () => Navigator.pop(context),
              ),
            ),
          ),
        ],
        body: body,
      );
    }
  }
}
