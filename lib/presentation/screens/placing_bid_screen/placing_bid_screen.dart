import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../styles.dart';
import '../../widgets/avatar.dart';
import '../../widgets/custom_formbuilder_textfield.dart';

class PlacingBidScreen extends StatefulWidget {
  static const String route = 'placing-bid-screen';
  PlacingBidScreen({super.key});

  @override
  State<PlacingBidScreen> createState() => _PlacingBidScreenState();
}

class _PlacingBidScreenState extends State<PlacingBidScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController _bids = new TextEditingController();

  final List<String> imageList = [
    "images/hall1.jpg",
    "images/hall4.jpg",
    "images/hall3.jpg",
  ];
  @override
  void initState() {
    _bids.text = "12";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomAppBarAndBody(
      title: "Place A Bid",
      showBackButton: true,
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  ),
                  items: imageList
                      .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              SizedBox(
                                height: 140,
                                width: 168,
                                child: Image.network(
                                  "https://assets3.thrillist.com/v1/image/2676503/2880x1620/crop;webp=auto;jpeg_quality=60;progressive.jpg",
                                  fit: BoxFit.fill,
                                ),
                                // color: Colors.grey,
                              ),
                            ],
                          )))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Listing Title",
                    style: Theme.of(context).textTheme.headline4),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("Asking Price: ",
                        style: Theme.of(context).textTheme.headline4),
                    Text("Rs 3000000",
                        style: Theme.of(context).textTheme.headline4),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 15,
                  child: Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: Styles.elevation3,
                            ),
                            child: const Avatar(
                              radius: 30,
                              avatarUrl: 'https://picsum.photos/200',
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Text("Seller : ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  Text("Hunain Arif",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Text("Phone Number: ",
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  Text("03008978401",
                                      style:
                                          Theme.of(context).textTheme.caption),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 20,
                  child: Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "23:20:00",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                              Text(
                                "Time Left",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Container(
                            width: 2,
                            height: 60,
                            color: Colors.grey,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "12 connects",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 20),
                              ),
                              Text(
                                "Higest Bid",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 20,
                  child: Container(
                      height: 120,
                      //  width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Place Your Bid",
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 350,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomFormBuilderTextField(
                                    name: "listing_title",
                                    focusNode: FocusNode(),
                                    controller: _bids,
                                    labelText: _bids.text,
                                    validators: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.max(25),
                                    ]),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_rounded,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
