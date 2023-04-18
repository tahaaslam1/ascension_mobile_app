import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ListingImagesWidget extends StatelessWidget {
  final List<String> images;
  const ListingImagesWidget({
    required this.images,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(enlargeCenterPage: true, enableInfiniteScroll: false, autoPlay: true),
        items: images.map((e) => ClipRRect(borderRadius: BorderRadius.circular(8), child: Stack(fit: StackFit.expand, children: [Image.network(e, fit: BoxFit.cover)]))).toList(),
      ),
    );
  }
}
