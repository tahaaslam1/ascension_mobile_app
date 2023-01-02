import 'package:ascension_mobile_app/constants.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/services/app_message_service.dart';
import 'package:bloc/bloc.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'listing_image_state.dart';

class ListingImageCubit extends Cubit<ListingImageState> {
  ListingImageCubit() : super(ListingImageInitial());

  void selectImages() async {
    emit(ListingImageInitial());
    try {
      List<XFile> selectedImages = await state.imagePicker.pickMultiImage();

      if (selectedImages.isNotEmpty) {
        emit(ListingImageSelected(imagesList: selectedImages));
      }
    } catch (error) {
      logger.e(error);
      emit(ListingImageError(errorMessage: AppMessageService.genericErrorMessage));
    }
  }
}
