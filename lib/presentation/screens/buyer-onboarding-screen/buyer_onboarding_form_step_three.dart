import 'package:ascension_mobile_app/presentation/widgets/custom_elevated_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BuyerOnBoardingStepThree extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  BuyerOnBoardingStepThree({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                // height: 100,
                // width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://cdn-icons-png.flaticon.com/512/4551/4551689.png",
                      fit: BoxFit.fill,
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                  ),
                ),
              ),
            ),
            Text("Add Your Profile Picture",
                style: Theme.of(context).textTheme.headline4),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: OutlinedButton(
                onPressed: () {},
                child: Text("Add Photo"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(onPressed: () {}, child: Text("Skip")),
          ]),
    );
  }
}
