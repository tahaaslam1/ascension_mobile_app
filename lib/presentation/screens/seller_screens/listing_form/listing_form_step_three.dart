import 'dart:io';
import 'package:ascension_mobile_app/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../business_logic/cubits/listing_form_flow_screen/image_picker_cubit/listing_image_cubit.dart';

class ListingFormStepThree extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const ListingFormStepThree({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BlocConsumer<ListingImageCubit, ListingImageState>(
        listener: (context, state) {
          if (state is ListingImageError) {
            SnackBarService.showGenericErrorSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is ListingImageInitial) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    List<XFile> selectedImages = await imagePicker.pickMultiImage();
                    BlocProvider.of<ListingImageCubit>(context).selectImages(selectedImages);
                  },
                  child: SizedBox(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(child: Text("Select Images")),
                  ),
                ),
              ],
            );
          }
          if (state is ListingImageSelected) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    List<XFile> selectedImages = await imagePicker.pickMultiImage();
                    BlocProvider.of<ListingImageCubit>(context).selectImages(selectedImages);
                  },
                  child: SizedBox(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(child: Text("Select Images")),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.imagesList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                          child: Image.file(
                            File(state.imagesList[index].path),
                            fit: BoxFit.cover,
                          ),
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
