import 'dart:io';

import 'package:ascension_mobile_app/logger.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

import 'local_widgets/cubit/cubit/custom_image_cubit.dart';

class ListingFormStepFour extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const ListingFormStepFour({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BlocBuilder<CustomImageCubit, CustomImageState>(
        builder: (context, state) {
          if (state is CustomImageInitial) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CustomImageCubit>(context).selectImages();
                  },
                  child: const Text("Add Images"),
                ),
              ],
            );
          }
          if (state is CustomImageSelected) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CustomImageCubit>(context).selectImages();
                  },
                  child: const Text("Add Images"),
                ),
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.imageFileList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Image.file(
                          File(state.imageFileList[index].path),
                          fit: BoxFit.cover,
                        );
                      }),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
