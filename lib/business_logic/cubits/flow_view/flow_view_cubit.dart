import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'flow_view_state.dart';

class FlowViewCubit extends Cubit<FlowViewState> {
  BuildContext context;

  FlowViewCubit({required int currentStep, required int totalSteps, required bool isLoading, required this.context})
      : super(FlowViewState(currentStep: currentStep, isLoading: isLoading, totalSteps: totalSteps));

  void next() {
    if (state.currentStep < state.totalSteps) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    } else {
      complete();
    }
  }

  void back() {
    if (state.currentStep > 1) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    } else {
      _pop();
    }
  }

  void complete() {
    _pop();
  }

  void setIsLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  void _pop() {
    context.router.pop();
  }
}
