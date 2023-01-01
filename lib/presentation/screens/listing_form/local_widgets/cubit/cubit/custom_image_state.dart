part of 'custom_image_cubit.dart';

abstract class CustomImageState extends Equatable {
  List<XFile> imagesFileList;
  ImagePicker imagePicker = ImagePicker();
  CustomImageState({this.imagesFileList = const []});

  @override
  List<Object> get props => [];
}

class CustomImageInitial extends CustomImageState {}

class CustomImageError extends CustomImageState {
  CustomImageError();
}

class CustomImageSelected extends CustomImageState {
  final List<XFile> imageFileList;

  CustomImageSelected({required this.imageFileList}) : super (imagesFileList: imageFileList );
}
