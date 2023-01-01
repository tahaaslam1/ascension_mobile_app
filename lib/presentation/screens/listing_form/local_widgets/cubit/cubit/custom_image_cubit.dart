import 'package:ascension_mobile_app/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'custom_image_state.dart';

class CustomImageCubit extends Cubit<CustomImageState> {
  CustomImageCubit() : super(CustomImageInitial());

  void uploadImages({required selectedImages}) {
    logger.d(selectedImages);
  }

  void selectImages() async {
    emit(CustomImageInitial());
    List<XFile> selectedImages = await state.imagePicker.pickMultiImage();

    logger.d(selectedImages);

    //  logger.d(selectedImages.forEach((element) { element.path;}));
    //  final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    // logger.d(selectedImages!.first.mimeType);
    // logger.d(selectedImages.first.name);
    // logger.d(selectedImages.first.path);

    if (selectedImages.isNotEmpty) {
      emit(CustomImageSelected(imageFileList: selectedImages));
    }
    // uploadImages(selectedImages: selectedImages);
    // print("Image List Length:" + imageFileList!.length.toString());
  }
}
