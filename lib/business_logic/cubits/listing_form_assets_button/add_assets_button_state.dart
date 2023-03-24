part of 'add_assets_button_cubit.dart';

class AddAssetsButtonState extends Equatable {
  final double buttonHeight;
  final bool isExpanded;
  final bool showContainers;
  final bool isEditing;
  final List<String> assets;

  const AddAssetsButtonState({required this.buttonHeight, required this.isExpanded, required this.showContainers, required this.isEditing, required this.assets});

  @override
  List<Object> get props => [buttonHeight, isExpanded, showContainers, isEditing, assets];

  AddAssetsButtonState copyWith({double? buttonHeight, bool? isExpanded, bool? showContainers, bool? isEditing, List<String>? assets}) {
    return AddAssetsButtonState(
      buttonHeight: buttonHeight ?? this.buttonHeight,
      isExpanded: isExpanded ?? this.isExpanded,
      showContainers: showContainers ?? this.showContainers,
      isEditing: isEditing ?? this.isEditing,
      assets: assets ?? this.assets,
    );
  }
}
