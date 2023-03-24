import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'add_assets_button_state.dart';

class AddAssetsButtonCubit extends Cubit<AddAssetsButtonState> {
  BuildContext context;

  AddAssetsButtonCubit({
    required double buttonHeight,
    required bool isExpanded,
    required bool showContainers,
    required bool isEditing,
    required List<String> assets,
    required this.context,
  }) : super(AddAssetsButtonState(
          buttonHeight: buttonHeight,
          isExpanded: isExpanded,
          showContainers: showContainers,
          isEditing: isEditing,
          assets: assets,
        ));

  void expand() async {
    if (!state.isExpanded) {
      emit(state.copyWith(isExpanded: true, buttonHeight: 400, showContainers: false));
    }
  }

  void collapse() {
    if (state.isExpanded) {
      emit(state.copyWith(isExpanded: false, buttonHeight: 54, showContainers: false));
    }
  }

  void showContainer() {
    if (state.isExpanded) {
      emit(state.copyWith(showContainers: true));
    }
  }

  void toggleIsEditing() {
    emit(state.copyWith(isEditing: !state.isEditing));
  }

  void addQualification(newAssets) {
    List<String> assets = List<String>.of(state.assets);
    assets.add(newAssets);
    emit(state.copyWith(assets: assets));
  }

  void deleteQualification(toBeDeletedAsset) {
    List<String> assets = List<String>.of(state.assets);
    assets.removeWhere((asset) => asset == toBeDeletedAsset);
    emit(state.copyWith(assets: assets));
  }
}
